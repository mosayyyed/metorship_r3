import '../../domain/entities/menu_item.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/menu_repository.dart';

// In-memory menu repository (Data Layer)
// SRP: Handles storage concerns for menu items only.
// OCP/DIP: Replace with DB implementation without touching upper layers.
class InMemoryMenuRepository implements MenuRepository {
  final Map<String, MenuItem> _items = {};
  final Set<String> _categories = {'Hot Drinks', 'Cold Drinks', 'Desserts'};

  @override
  void add(MenuItem item) {
    _items[item.id] = item;
  }

  @override
  void update(MenuItem item) {
    if (!_items.containsKey(item.id)) {
      throw ArgumentError('Item not found');
    }
    _items[item.id] = item;
  }

  @override
  void delete(String id) {
    _items.remove(id);
  }

  @override
  List<MenuItem> getAll() =>
      _items.values.toList()..sort((a, b) => a.name.compareTo(b.name));

  @override
  MenuItem? getById(String id) => _items[id];

  @override
  List<Category> getCategories() => _categories.map((e) => Category(e)).toList()
    ..sort((a, b) => a.name.compareTo(b.name));

  @override
  void addCategory(Category category) {
    _categories.add(category.name);
  }

  @override
  void deleteCategory(String name) {
    _categories.remove(name);
    _items.removeWhere((key, value) => value.category.name == name);
  }
}
