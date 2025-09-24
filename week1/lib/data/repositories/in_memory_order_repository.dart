import '../../domain/repositories/order_repository.dart';
import '../../domain/entities/order.dart';

// In-memory order repository (Data Layer)
class InMemoryOrderRepository implements OrderRepository {
  final Map<String, Order> _orders = {};

  @override
  void addOrder(Order order) {
    _orders[order.id] = order;
  }

  @override
  void updateOrder(Order order) {
    if (!_orders.containsKey(order.id)) throw ArgumentError('Order not found');
    _orders[order.id] = order;
  }

  @override
  List<Order> getAll() => _orders.values.toList()
    ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

  @override
  List<Order> getPending() => _orders.values.where((o) => !o.completed).toList()
    ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

  @override
  List<Order> getCompleted() =>
      _orders.values.where((o) => o.completed).toList();

  @override
  List<Order> getByDate(DateTime date) {
    final dayStart = DateTime(date.year, date.month, date.day);
    final nextDay = dayStart.add(const Duration(days: 1));
    return _orders.values
        .where((o) =>
            o.createdAt
                .isAfter(dayStart.subtract(const Duration(milliseconds: 1))) &&
            o.createdAt.isBefore(nextDay))
        .toList();
  }
}
