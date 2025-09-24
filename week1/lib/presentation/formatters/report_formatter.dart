import '../../domain/entities/report.dart';

class ReportFormatter {
  static String render(Report report) {
    final b = StringBuffer();
    b.writeln(
        '-- Daily Report (${report.date.toLocal().toString().split(' ').first}) --');
    b.writeln('Total Orders: ${report.totalOrders}');
    b.writeln('Revenue: EGP ${report.totalRevenue.toStringAsFixed(2)}');
    b.writeln('Top Selling:');
    if (report.topSelling.isEmpty) {
      b.writeln('  (No sales yet)');
    } else {
      for (final item in report.topSelling) {
        b.writeln(
            '  ${item.itemName}: ${item.quantitySold} sold (EGP ${item.revenue.toStringAsFixed(2)})');
      }
    }
    return b.toString();
  }
}
