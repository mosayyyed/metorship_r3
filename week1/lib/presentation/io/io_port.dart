// IO Abstraction (DIP) - allows swapping console with other UI (web, test harness)
// SRP: Defines contract. OCP: New implementations can extend without modifying consumers.
abstract class IOPort {
  void write(String message);
  void writeln([String message = '']);
  String? readLine();
}
