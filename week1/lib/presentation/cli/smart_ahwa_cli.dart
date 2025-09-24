import '../../domain/entities/category.dart';
import '../../domain/entities/drink.dart';
import '../../domain/repositories/menu_repository.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/usecases/generate_daily_report.dart';
import '../io/io_port.dart';
import '../io/console_io.dart';
import '../controllers/order_controller.dart';
import '../controllers/menu_controller.dart';
import '../controllers/report_controller.dart';

// Facade / Coordinator: delegates to controllers (SRP: high-level navigation only)
class SmartAhwaCLI {
  final MenuRepository menuRepo;
  final OrderRepository orderRepo;
  final GenerateDailyReport reportUseCase;
  final IOPort io;
  late final OrderController orderController;
  late final MenuController menuController;
  late final ReportController reportController;

  SmartAhwaCLI({
    required this.menuRepo,
    required this.orderRepo,
    required this.reportUseCase,
    IOPort? io,
  }) : io = io ?? ConsoleIO() {
    orderController =
        OrderController(menuRepo: menuRepo, orderRepo: orderRepo, io: this.io);
    menuController = MenuController(menuRepo: menuRepo, io: this.io);
    reportController =
        ReportController(reportUseCase: reportUseCase, io: this.io);
  }

  void run() {
    _seedSampleData();
    bool exit = false;
    while (!exit) {
      io.writeln('\n=== Smart Ahwa Manager ===');
      io.writeln('1) Place New Order');
      io.writeln('2) View Pending Orders / Complete');
      io.writeln('3) Menu Settings');
      io.writeln('4) Daily Report');
      io.writeln('5) Exit');
      io.write('Select option: ');
      final choice = io.readLine();
      switch (choice) {
        case '1':
          orderController.placeOrder();
          break;
        case '2':
          orderController.showPending();
          break;
        case '3':
          _menuSettings();
          break;
        case '4':
          reportController.showToday();
          break;
        case '5':
          exit = true;
          break;
        default:
          io.writeln('Invalid selection');
      }
    }
    io.writeln('Shukran! Goodbye.');
  }

  void _menuSettings() {
    bool back = false;
    while (!back) {
      io.writeln('\n-- Menu Settings --');
      io.writeln('1) List Items');
      io.writeln('2) Add Item');
      io.writeln('3) Edit Item');
      io.writeln('4) Delete Item');
      io.writeln('5) Manage Categories');
      io.writeln('6) Back');
      io.write('Choice: ');
      final c = io.readLine();
      switch (c) {
        case '1':
          menuController.listItems();
          break;
        case '2':
          menuController.addItem();
          break;
        case '3':
          menuController.editItem();
          break;
        case '4':
          menuController.deleteItem();
          break;
        case '5':
          menuController.manageCategories();
          break;
        case '6':
          back = true;
          break;
        default:
          io.writeln('Invalid');
      }
    }
  }

  void _seedSampleData() {
    if (menuRepo.getAll().isNotEmpty) return;
    final hot = Category('Hot Drinks');
    final cold = Category('Cold Drinks');
    final desserts = Category('Desserts');
    menuRepo.add(Drink(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Espresso',
        price: 25,
        category: hot,
        isHot: true));
    menuRepo.add(Drink(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Tea',
        price: 15,
        category: hot,
        isHot: true));
    menuRepo.add(Drink(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Iced Coffee',
        price: 35,
        category: cold,
        isHot: false));
    menuRepo.add(Drink(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Lemon Mint',
        price: 30,
        category: cold,
        isHot: false));
    menuRepo.add(Drink(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Basbousa',
        price: 20,
        category: desserts,
        isHot: false));
  }
}
