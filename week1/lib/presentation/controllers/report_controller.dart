import '../../domain/usecases/generate_daily_report.dart';
import '../io/io_port.dart';
import '../formatters/report_formatter.dart';

// ReportController - SRP: reporting workflows.
class ReportController {
  final GenerateDailyReport reportUseCase;
  final IOPort io;
  ReportController({required this.reportUseCase, required this.io});

  void showToday() {
    final now = DateTime.now();
    final report = reportUseCase.execute(now);
    io.writeln('\n' + ReportFormatter.render(report));
  }
}
