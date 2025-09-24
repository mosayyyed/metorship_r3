// This is a basic Flutter widget test for Anime Verse App.// This is a basic Flutter widget test.

////

// To perform an interaction with a widget in your test, use the WidgetTester// To perform an interaction with a widget in your test, use the WidgetTester

// utility in the flutter_test package. For example, you can send tap and scroll// utility in the flutter_test package. For example, you can send tap and scroll

// gestures. You can also use WidgetTester to find child widgets in the widget// gestures. You can also use WidgetTester to find child widgets in the widget

// tree, read text, and verify that the values of widget properties are correct.// tree, read text, and verify that the values of widget properties are correct.



import 'package:flutter/material.dart';import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';import 'package:flutter_test/flutter_test.dart';



import 'package:anime_verse/anime_verse_app.dart';import 'package:anime_verse/main.dart';



void main() {void main() {

  testWidgets('Anime Verse App smoke test', (WidgetTester tester) async {  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    // Build our app and trigger a frame.    // Build our app and trigger a frame.

    await tester.pumpWidget(const AnimeVerseApp());    await tester.pumpWidget(const MyApp());



    // Verify that the app starts successfully.    // Verify that our counter starts at 0.

    expect(find.byType(MaterialApp), findsOneWidget);    expect(find.text('0'), findsOneWidget);

        expect(find.text('1'), findsNothing);

    // Wait for the app to settle

    await tester.pumpAndSettle();    // Tap the '+' icon and trigger a frame.

        await tester.tap(find.byIcon(Icons.add));

    // The app should be running without errors    await tester.pump();

    expect(tester.takeException(), isNull);

  });    // Verify that our counter has incremented.

}    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
