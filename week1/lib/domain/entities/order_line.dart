import 'menu_item.dart';

// OrderLine (Domain Layer)
// SRP: Holds item + quantity and exposes computed total.
class OrderLine {
  final MenuItem item;
  int quantity;
  OrderLine({required this.item, required this.quantity});
  double get lineTotal => item.price * quantity;
}
