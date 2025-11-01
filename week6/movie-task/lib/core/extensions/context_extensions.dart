import 'package:flutter/material.dart';

/// Handy BuildContext extension getters for quick theme access.
///
/// Usage:
///   final cs = context.colorScheme;
///   final isDark = context.isDark;
extension ContextThemeExtensions on BuildContext {
  /// Returns the current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// Shortcut to the current [ColorScheme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Shortcut to the current [TextTheme].
  TextTheme get textTheme => theme.textTheme;

  /// Whether the active theme is dark.
  bool get isDark => theme.brightness == Brightness.dark;
}
