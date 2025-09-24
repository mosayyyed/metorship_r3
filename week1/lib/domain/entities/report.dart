// Report & ReportItem (Domain Layer)
class Report {
  final DateTime date;
  final int totalOrders;
  final double totalRevenue;
  final List<ReportItem> topSelling;

  Report({
    required this.date,
    required this.totalOrders,
    required this.totalRevenue,
    required this.topSelling,
  });
}

class ReportItem {
  final String itemName;
  final int quantitySold;
  final double revenue;
  ReportItem(
      {required this.itemName,
      required this.quantitySold,
      required this.revenue});
}
