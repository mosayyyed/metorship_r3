<div>

# Smart Ahwa Manager CLI

### (Mentorship Shop Task – Omar Ahmed – Round 3)

Manage a traditional Cairo café ( "Ahwa" ) operations via a Command Line Interface built with **Dart**, applying **Clean Architecture**, **SOLID principles**, and core **OOP concepts**.

</div>

---

## 1. Overview
This project demonstrates how to structure a non-trivial CLI application using Clean Architecture boundaries (Domain / Data / Presentation) while keeping business logic independent from I/O, storage, and formatting concerns. It is intentionally simple (in‑memory persistence) yet extensible (can plug a database, REST API, or different presentation layer later) without rewriting the core.

Core Features:
- Place new orders (multi-item, customer name, notes)
- List & complete pending orders
- Manage menu items & categories (add / edit / delete)
- Generate daily sales report (top selling, totals, revenue)

---

## 2. Folder Structure (Clean Architecture Mapping)
```
lib/
  domain/                      <-- Enterprise / business rules
    entities/                  (Category, MenuItem, Drink, OrderLine, Order, Report)
    repositories/              (Abstract contracts: MenuRepository, OrderRepository)
    usecases/                  (GenerateDailyReport)
  data/                        <-- Infrastructure implementations
    repositories/              (InMemoryMenuRepository, InMemoryOrderRepository)
  presentation/                <-- Delivery mechanism (CLI)
    io/                        (IOPort abstraction + ConsoleIO implementation)
    controllers/               (OrderController, MenuController, ReportController)
    formatters/                (OrderFormatter, MenuFormatter, ReportFormatter)
    cli/                       (SmartAhwaCLI facade / coordinator)
  lib.dart                     (Barrel exports for convenience)
bin/
  smart_ahwa_cli.dart          <-- Composition root / entrypoint
```

### Layer Responsibilities
| Layer | Responsibility | Knows About | Never Knows |
|-------|----------------|-------------|-------------|
| Domain | Pure business rules & invariants | Itself | Console, storage details |
| Data | Implements persistence (here in-memory) | Domain abstractions | Presentation controllers |
| Presentation | User interaction workflow | Domain abstractions + Use Cases | Concrete data storage internals |

---

## 3. Entities (Domain Layer)
| Entity | Purpose |
|--------|---------|
| `Category` | Represents a logical grouping (e.g., Hot Drinks). |
| `MenuItem` (abstract) | Base abstraction for all sellable items (future: Dessert, Snack). |
| `Drink` | Concrete item with `isHot` specialization. |
| `OrderLine` | Pairing of item + quantity + line total logic. |
| `Order` | Aggregate root holding order lines, customer data, total calculation. |
| `Report` / `ReportItem` | Aggregated daily metrics for analytics. |

---

## 4. Repositories & Use Case
| Contract | Methods (Summary) | Notes |
|----------|------------------|-------|
| `MenuRepository` | CRUD for items, list categories | Abstract: enables DB / API swap |
| `OrderRepository` | Add/update/query orders & filter by date/status | Query logic stays simple in-memory |
| `GenerateDailyReport` | `execute(DateTime)` returns `Report` | Orchestrates aggregation (SRP) |

The use case isolates non-trivial aggregation (top sellers, revenue) so reports can evolve independently (e.g., add average ticket size, peak hour histogram, etc.).

---

## 5. Presentation Layer Decomposition
Instead of a monolithic CLI class, the layer is split:
| Component | Responsibility | SOLID Angle |
|-----------|---------------|-------------|
| `IOPort` | Abstraction for input/output | DIP (decouple from `stdin/stdout`) |
| `ConsoleIO` | Concrete adapter over Dart I/O | Replaceable in tests |
| `OrderController` | Order workflows (place, list, complete) | SRP & Testable |
| `MenuController` | CRUD + category management | SRP |
| `ReportController` | Rendering daily report | SRP |
| `Formatters` | Pure formatting (no logic) | Separation of concerns |
| `SmartAhwaCLI` | High-level navigation / menu dispatch | Facade; Orchestrator only |

This separation allows: injecting a scripted `FakeIOPort` for deterministic test scenarios; adding a GUI wrapper that calls the same controllers; or layering an HTTP interface while reusing the same domain & data.

---

## 6. SOLID Principle Mapping (Detailed)
| Principle | Where Applied | Explanation |
|-----------|---------------|-------------|
| Single Responsibility (SRP) | Controllers, Formatters, Use Case, Entities | Each file/class handles exactly one responsibility (e.g., `OrderController` ≠ formatting output). |
| Open/Closed (OCP) | `MenuItem` abstraction, repository interfaces, IOPort | Add new item types or storage adapters without editing existing logic. |
| Liskov Substitution (LSP) | `Drink` extends `MenuItem` | Any consumer using `MenuItem` (e.g., adding to `OrderLine`) works seamlessly with `Drink` or future `Dessert`. |
| Interface Segregation (ISP) | Separate `MenuRepository` & `OrderRepository` | Clients depend only on methods they use; no bloated “God” repository. |
| Dependency Inversion (DIP) | Controllers depend on abstractions (`MenuRepository`, `OrderRepository`, `IOPort`) | High-level policy code is independent of low-level details (in-memory vs DB). |

---

## 7. OOP Concepts
| Concept | Implementation |
|---------|----------------|
| Encapsulation | Private order line list inside `Order` (`_lines`) + unmodifiable exposure. |
| Inheritance | `Drink` extends `MenuItem`. |
| Polymorphism | `MenuItem.describe()` overridden by `Drink` (future dessert/snack types). |
| Composition | `Order` composed of `OrderLine` which composes `MenuItem`. |
| Abstraction | Repository interfaces + IOPort isolate behavior from implementation. |

---

## 8. Data Layer (Current In-Memory Strategy)
The `InMemory*Repository` classes intentionally keep storage trivial. To evolve:
1. Introduce `JsonMenuRepository` writing to a local file.
2. Later, replace with `SqliteMenuRepository` using `sqflite` in a Flutter / server context.
3. Controllers remain unchanged (DIP payoff).

---

## 9. Extensibility Roadmap
| Enhancement | Layer Impact | Notes |
|-------------|-------------|-------|
| Persistent storage (JSON / SQLite) | Data only | Implement new repositories. |
| Discounts / Promotions | Domain + Use Case | Add strategy objects for pricing. |
| Multi-day analytics | New Use Cases | Build `GeneratePeriodReport`. |
| Localization | Presentation | Swap formatters / message catalogs. |
| Automated tests | All layers (except pure formatting) | Mock `IOPort` & repositories. |

---

## 10. Running & Usage
Install dependencies then launch (entrypoint relocated to `lib/main.dart`):
```bash
dart pub get
dart run lib/main.dart
```

Typical Flow:
1. Choose option 1 → build order by selecting item numbers repeatedly (empty line to finish).
2. Confirm order → listed under pending.
3. Option 2 → select order → mark completed.
4. Option 3 → manage menu & categories.
5. Option 4 → view daily report (top 5 items, totals, revenue).

---

## 11. Testing Strategy (Suggested)
Although not bundled yet, tests would:
| Test Type | Focus |
|-----------|-------|
| Unit | `GenerateDailyReport`, `Order` aggregation, controllers with fake IO. |
| Integration | End-to-end CLI script simulation via injected `ScriptedIOPort`. |
| Mutation (optional) | Validate robustness of aggregation logic. |

Example Fake IO Pattern:
```dart
class FakeIO implements IOPort {
  final Queue<String> input;
  final List<String> output = [];
  FakeIO(List<String> scripted) : input = Queue.of(scripted);
  @override String? readLine() => input.isEmpty ? '' : input.removeFirst();
  @override void write(String message) => output.add(message);
  @override void writeln([String m = '']) => output.add(m + '\n');
}
```

---

## 12. Why Clean Architecture Helps Here
Despite being a CLI prototype, this separation prevents “ball of mud” growth: new features (loyalty points, invoice printing, external API) attach through new interfaces or controllers, not wholesale rewrites. Business rules (order totals, reporting aggregation) stay testable and independent from side effects (I/O, persistence). This minimizes coupling and increases cohesion, directly improving maintainability and onboarding speed for future contributors.

---

## 13. Attribution
This implementation is part of the: **Mentorship Shop Task – Omar Ahmed – Round 3**.

NOTE: The `main()` entrypoint has been intentionally placed under `lib/main.dart` instead of the conventional `bin/` directory per project requirement. For publishing to pub.dev or multi-executable setups, consider restoring a `/bin` entrypoint and keeping `lib/` purely for libraries.

---

## 14. License
Educational / demonstration purposes. Extend freely with attribution.

