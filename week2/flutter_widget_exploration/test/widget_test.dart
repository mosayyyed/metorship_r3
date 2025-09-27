// This is a basic Flutter widget test for the Flutter Widget Exploration app.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_widget_exploration/main.dart';

void main() {
  testWidgets('Flutter Widget Exploration app smoke test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlutterWidgetExplorationApp());

    // Verify that the app starts with the Tasks screen
    expect(find.text('Tasks Challenge'), findsOneWidget);

    // Verify that all bottom navigation tabs are present
    expect(find.text('Tasks'), findsOneWidget);
    expect(find.text('Physics'), findsOneWidget);
    expect(find.text('Animation'), findsOneWidget);

    // Verify that initial tasks are present
    expect(find.text('Learn Flutter Basics'), findsOneWidget);
    expect(find.text('Practice Widgets'), findsOneWidget);
    expect(find.text('Build Your First App'), findsOneWidget);
  });

  testWidgets('Navigation between screens works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlutterWidgetExplorationApp());

    // Tap on Physics tab
    await tester.tap(find.text('Physics'));
    await tester.pump();

    // Verify we're on Physics screen
    expect(find.text('Match Colors'), findsOneWidget);

    // Tap on Animation tab
    await tester.tap(find.text('Animation'));
    await tester.pump();

    // Verify we're on Animation screen
    expect(find.text('Loading Animation'), findsOneWidget);
  });
}
