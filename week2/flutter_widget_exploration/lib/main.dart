import 'package:flutter/material.dart';
import 'package:flutter_widget_exploration/presentation/screens/layout_screen.dart';

void main() {
  runApp(const FlutterWidgetExplorationApp());
}

class FlutterWidgetExplorationApp extends StatelessWidget {
  const FlutterWidgetExplorationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Exploration',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
