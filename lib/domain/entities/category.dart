// Category Entity (Domain Layer)
// SRP: Represents only a menu category concept.
class Category {
  final String name;
  Category(this.name);
  @override
  String toString() => name;
}
