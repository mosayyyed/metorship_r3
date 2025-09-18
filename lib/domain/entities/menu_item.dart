import 'category.dart';

// Abstract MenuItem (Domain Layer)
// OCP: New item types can extend this without modifying existing code.
// LSP: Subtypes must honor interface (e.g., Drink).
abstract class MenuItem {
  final String id;
  String name; // Encapsulation: limited mutable fields.
  double price;
  Category category;

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });

  String describe(); // Polymorphism.
}
