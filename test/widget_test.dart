// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multipage/email_widget.dart';

import 'package:multipage/password_widget.dart';

void main() {
  testWidgets('Test email validation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: EmailWidget(index: 0),
      ),
    ));

    await tester.enterText(find.byKey(const Key("emailInput")), "wrong.email");
    await tester.tap(find.byKey(const Key("nextButton")));
    await tester.pump();

    expect(find.text("Please enter a valid email address"), findsOneWidget);
  });

  testWidgets('Test password validation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: PasswordWidget(index: 1),
      ),
    ));

    await tester.enterText(find.byKey(const Key("passwordInput")), "1234");
    await tester.tap(find.byKey(const Key("submitButton")));
    await tester.pump();

    expect(find.text("Your password should contain at least 5 characters"),
        findsOneWidget);
  });
}
