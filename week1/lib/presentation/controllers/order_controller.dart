import 'dart:math';
import '../../domain/entities/order.dart';
import '../../domain/repositories/menu_repository.dart';
import '../../domain/repositories/order_repository.dart';
import '../io/io_port.dart';
import '../formatters/order_formatter.dart';

// OrderController - SRP: orchestrates order workflows only.
class OrderController {
  final MenuRepository menuRepo;
  final OrderRepository orderRepo;
  final IOPort io;

  OrderController(
      {required this.menuRepo, required this.orderRepo, required this.io});

  void placeOrder() {
    io.writeln('\n-- Place New Order --');
    io.write('Customer name: ');
    final customer = io.readLine() ?? 'Walk-in';
    io.write('Notes / special instructions (optional): ');
    final notes = io.readLine();
    final order = Order(
        id: _id(),
        customerName: customer,
        notes: notes?.isEmpty == true ? null : notes);

    bool adding = true;
    while (adding) {
      final items = menuRepo.getAll();
      if (items.isEmpty) {
        io.writeln('Menu is empty. Add items first.');
        break;
      }
      for (var i = 0; i < items.length; i++) {
        io.writeln(
            '${i + 1}) ${items[i].describe()} (Category: ${items[i].category.name})');
      }
      io.write('Select item number (Enter to finish): ');
      final sel = io.readLine();
      if (sel == null || sel.isEmpty) {
        adding = false;
        break;
      }
      final idx = int.tryParse(sel);
      if (idx == null || idx < 1 || idx > items.length) {
        io.writeln('Invalid item.');
        continue;
      }
      io.write('Quantity: ');
      final qty = int.tryParse(io.readLine() ?? '1') ?? 1;
      order.addLine(items[idx - 1], qty);
      io.writeln('Added ${qty}x ${items[idx - 1].name}.');
    }
    if (order.lines.isEmpty) {
      io.writeln('No items added. Order cancelled.');
      return;
    }

    io.writeln('\n' + OrderFormatter.summarize(order));
    io.write('Confirm order? (y/n): ');
    final c = io.readLine();
    if (c?.toLowerCase() == 'y') {
      orderRepo.addOrder(order);
      io.writeln('Order placed with ID: ${order.id}');
    } else {
      io.writeln('Order discarded.');
    }
  }

  void showPending() {
    final pending = orderRepo.getPending();
    if (pending.isEmpty) {
      io.writeln('\nNo pending orders.');
      return;
    }
    for (var i = 0; i < pending.length; i++) {
      final o = pending[i];
      io.writeln(
          '${i + 1}) ID:${o.id} ${o.customerName} - ${o.lines.length} items - Total ${o.total.toStringAsFixed(2)}');
    }
    io.write('Select order number (Enter to return): ');
    final sel = io.readLine();
    if (sel == null || sel.isEmpty) return;
    final idx = int.tryParse(sel);
    if (idx == null || idx < 1 || idx > pending.length) {
      io.writeln('Invalid');
      return;
    }
    final order = pending[idx - 1];
    io.writeln(OrderFormatter.summarize(order));
    io.write('Mark as completed? (y/n): ');
    final c = io.readLine();
    if (c?.toLowerCase() == 'y') {
      order.completed = true;
      orderRepo.updateOrder(order);
      io.writeln('Order completed.');
    }
  }

  String _id() => Random().nextInt(999999).toString().padLeft(6, '0');
}
