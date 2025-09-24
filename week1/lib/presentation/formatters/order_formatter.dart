import '../../domain/entities/order.dart';

// SRP: Handles only formatting of orders for display.
class OrderFormatter {
  static String summarize(Order order) {
    final buffer = StringBuffer();
    buffer.writeln('Order ${order.id} for ${order.customerName}');
    for (final line in order.lines) {
      buffer.writeln(
          ' - ${line.quantity}x ${line.item.name} = ${line.lineTotal.toStringAsFixed(2)}');
    }
    buffer.writeln('Total: EGP ${order.total.toStringAsFixed(2)}');
    if (order.notes != null) buffer.writeln('Notes: ${order.notes}');
    return buffer.toString();
  }
}
