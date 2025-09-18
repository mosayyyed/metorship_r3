import 'package:smart_ahwa_manager/data/repositories/in_memory_menu_repository.dart';
import 'package:smart_ahwa_manager/data/repositories/in_memory_order_repository.dart';
import 'package:smart_ahwa_manager/domain/usecases/generate_daily_report.dart';
import 'package:smart_ahwa_manager/presentation/cli/smart_ahwa_cli.dart';

void main(List<String> args) {
  final menuRepo = InMemoryMenuRepository();
  final orderRepo = InMemoryOrderRepository();
  final reportUseCase = GenerateDailyReport(orderRepo);
  final cli = SmartAhwaCLI(
    menuRepo: menuRepo,
    orderRepo: orderRepo,
    reportUseCase: reportUseCase,
  );
  cli.run();
}
