import 'dart:io';
import 'io_port.dart';

// Concrete Console implementation of IOPort.
class ConsoleIO implements IOPort {
  @override
  String? readLine() => stdin.readLineSync();

  @override
  void write(String message) => stdout.write(message);

  @override
  void writeln([String message = '']) => stdout.writeln(message);
}
