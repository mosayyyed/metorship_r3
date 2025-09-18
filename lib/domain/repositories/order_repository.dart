import '../entities/order.dart';

// OrderRepository abstraction (DIP target)
abstract class OrderRepository {
  void addOrder(Order order);
  void updateOrder(Order order);
  List<Order> getAll();
  List<Order> getPending();
  List<Order> getCompleted();
  List<Order> getByDate(DateTime date);
}
