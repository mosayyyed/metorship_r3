import '../repositories/order_repository.dart';
import '../entities/report.dart';

// Use Case: GenerateDailyReport
// SRP: Only aggregates and computes report metrics.
class GenerateDailyReport {
  final OrderRepository orderRepo; // DIP: depends on abstraction only.
  GenerateDailyReport(this.orderRepo);

  Report execute(DateTime day) {
    final orders = orderRepo.getByDate(day);
    final totalOrders = orders.length;
    double totalRevenue = 0.0;
    final Map<String, ReportItem> aggregation = {};

    for (final order in orders) {
      for (final line in order.lines) {
        totalRevenue += line.lineTotal;
        aggregation.update(
          line.item.name,
          (existing) => ReportItem(
            itemName: existing.itemName,
            quantitySold: existing.quantitySold + line.quantity,
            revenue: existing.revenue + line.lineTotal,
          ),
          ifAbsent: () => ReportItem(
            itemName: line.item.name,
            quantitySold: line.quantity,
            revenue: line.lineTotal,
          ),
        );
      }
    }

    final list = aggregation.values.toList();
    list.sort((a, b) => b.quantitySold.compareTo(a.quantitySold));

    return Report(
      date: DateTime(day.year, day.month, day.day),
      totalOrders: totalOrders,
      totalRevenue: totalRevenue,
      topSelling: list.take(5).toList(),
    );
  }
}
