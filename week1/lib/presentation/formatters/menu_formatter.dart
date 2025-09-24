import '../../domain/entities/menu_item.dart';

class MenuFormatter {
  static String list(List<MenuItem> items) {
    if (items.isEmpty) return 'No items.';
    final buffer = StringBuffer('Menu Items:\n');
    for (final item in items) {
      buffer.writeln(
          '${item.id}) ${item.describe()} | Category: ${item.category.name}');
    }
    return buffer.toString();
  }
}
