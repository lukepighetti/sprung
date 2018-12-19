// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import "dart:math" as Math;

import 'package:sprung/main.dart';

void main() {
  testWidgets('Startup test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Sprung Demo'), findsOneWidget);
  });

  test("sprung", () {
    final sprung = Sprung();

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: 5e-3));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: 5e-3));

    final pow = Math.pow;
    final sin = Math.sin;
    final cos = Math.cos;

    /// assumes m=1, k=180, c=20
    f(t) =>
        -0.5 *
        pow(2.71828, (-6 * t)) *
        (-2 * pow(2.71828, (6 * t)) + sin(12 * t) + 2 * cos(12 * t));

    expect(sprung.transform(0.1), moreOrLessEquals(f(0.1), epsilon: 5e-3));
  });
}
