import 'package:smart_ahwa_manager/domain/entities/category.dart';
import 'package:smart_ahwa_manager/domain/entities/drink.dart';
import 'package:smart_ahwa_manager/domain/repositories/menu_repository.dart';
import '../io/io_port.dart';
import '../formatters/menu_formatter.dart';

// MenuController - SRP: menu CRUD workflows.
class MenuController {
  final MenuRepository menuRepo;
  final IOPort io;
  MenuController({required this.menuRepo, required this.io});

  void listItems() {
    io.writeln(MenuFormatter.list(menuRepo.getAll()));
  }

  void addItem() {
    io.write('Name: ');
    final name = io.readLine();
    if (name == null || name.isEmpty) {
      io.writeln('Name required.');
      return;
    }
    io.write('Price: ');
    final price = double.tryParse(io.readLine() ?? '');
    if (price == null || price <= 0) {
      io.writeln('Invalid price.');
      return;
    }
    final cats = menuRepo.getCategories();
    if (cats.isEmpty) {
      io.writeln('No categories.');
      return;
    }
    for (var i = 0; i < cats.length; i++) {
      io.writeln('${i + 1}) ${cats[i].name}');
    }
    io.write('Select category: ');
    final sel = int.tryParse(io.readLine() ?? '');
    if (sel == null || sel < 1 || sel > cats.length) {
      io.writeln('Invalid');
      return;
    }
    io.write('Is hot? (y/n): ');
    final isHot = (io.readLine() ?? '').toLowerCase() == 'y';
    menuRepo.add(Drink(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: name,
        price: price,
        category: cats[sel - 1],
        isHot: isHot));
    io.writeln('Item added.');
  }

  void editItem() {
    final items = menuRepo.getAll();
    if (items.isEmpty) {
      io.writeln('No items.');
      return;
    }
    for (var i = 0; i < items.length; i++) {
      io.writeln('${i + 1}) ${items[i].describe()}');
    }
    io.write('Select item: ');
    final sel = int.tryParse(io.readLine() ?? '');
    if (sel == null || sel < 1 || sel > items.length) {
      io.writeln('Invalid');
      return;
    }
    final item = items[sel - 1];
    io.write('New name (${item.name}): ');
    final n = io.readLine();
    if (n != null && n.isNotEmpty) item.name = n;
    io.write('New price (${item.price}): ');
    final pStr = io.readLine();
    if (pStr != null && pStr.isNotEmpty) {
      final p = double.tryParse(pStr);
      if (p != null && p > 0) item.price = p;
    }
    final cats = menuRepo.getCategories();
    for (var i = 0; i < cats.length; i++) {
      io.writeln('${i + 1}) ${cats[i].name}');
    }
    io.write('New category (${item.category.name}): ');
    final cStr = io.readLine();
    if (cStr != null && cStr.isNotEmpty) {
      final cIdx = int.tryParse(cStr);
      if (cIdx != null && cIdx >= 1 && cIdx <= cats.length)
        item.category = cats[cIdx - 1];
    }
    if (item is Drink) {
      io.write('Is hot? (${item.isHot ? 'Hot' : 'Cold'}) y/n or Enter keep: ');
      final h = io.readLine();
      if (h != null && h.isNotEmpty) {
        final updated = Drink(
            id: item.id,
            name: item.name,
            price: item.price,
            category: item.category,
            isHot: h.toLowerCase() == 'y');
        menuRepo.update(updated);
        io.writeln('Updated.');
        return;
      }
    }
    menuRepo.update(item);
    io.writeln('Saved.');
  }

  void deleteItem() {
    final items = menuRepo.getAll();
    if (items.isEmpty) {
      io.writeln('No items.');
      return;
    }
    for (var i = 0; i < items.length; i++) {
      io.writeln('${i + 1}) ${items[i].describe()}');
    }
    io.write('Select item to delete: ');
    final sel = int.tryParse(io.readLine() ?? '');
    if (sel == null || sel < 1 || sel > items.length) {
      io.writeln('Invalid');
      return;
    }
    final item = items[sel - 1];
    menuRepo.delete(item.id);
    io.writeln('Deleted ${item.name}.');
  }

  void manageCategories() {
    bool back = false;
    while (!back) {
      final cats = menuRepo.getCategories();
      for (final c in cats) {
        io.writeln('- ${c.name}');
      }
      io.writeln('1) Add Category');
      io.writeln('2) Delete Category');
      io.writeln('3) Back');
      io.write('Choice: ');
      final sel = io.readLine();
      switch (sel) {
        case '1':
          io.write('New category name: ');
          final name = io.readLine();
          if (name != null && name.isNotEmpty) {
            menuRepo.addCategory(Category(name));
            io.writeln('Added.');
          }
          break;
        case '2':
          io.write('Category name to delete: ');
          final name = io.readLine();
          if (name != null && name.isNotEmpty) {
            menuRepo.deleteCategory(name);
            io.writeln('Deleted (if existed).');
          }
          break;
        case '3':
          back = true;
          break;
        default:
          io.writeln('Invalid');
      }
    }
  }
}
