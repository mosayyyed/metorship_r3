import 'order_line.dart';
import 'menu_item.dart';

// Order aggregate (Domain Layer)
// Encapsulation: _lines is private; modifications via addLine.
class Order {
  final String id;
  final String customerName;
  final String? notes;
  final DateTime createdAt;
  bool completed;
  final List<OrderLine> _lines = [];

  Order({
    required this.id,
    required this.customerName,
    this.notes,
    DateTime? createdAt,
    this.completed = false,
  }) : createdAt = createdAt ?? DateTime.now();

  List<OrderLine> get lines => List.unmodifiable(_lines);

  void addLine(MenuItem item, int qty) {
    if (qty <= 0) return;
    final existing = _lines.where((l) => l.item.id == item.id).toList();
    if (existing.isNotEmpty) {
      existing.first.quantity += qty;
    } else {
      _lines.add(OrderLine(item: item, quantity: qty));
    }
  }

  double get total => _lines.fold(0.0, (sum, l) => sum + l.lineTotal);
}
