// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';

void main() {
  testWidgets('Widget update test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify the initial state.
    expect(find.byType(TextFormField), findsAtLeastNWidgets(2));
    expect(find.text('0.0 BMI'), findsOneWidget);
    expect(find.text('UnderWeight'), findsOneWidget);

    //Filling the form.
    await tester.enterText(find.bySemanticsLabel('Height (in cms)'), '180');
    await tester.enterText(find.bySemanticsLabel('Weight (in kgs)'), '65');

    // Tap the 'calculate' button and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that BMI is updated.
    expect(find.text('20.1 BMI'), findsOneWidget);
    expect(find.text('Healthy'), findsOneWidget);
  });
}
