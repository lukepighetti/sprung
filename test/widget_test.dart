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
import 'package:sprung/sprung.dart';

final e = Math.exp;
final sin = Math.sin;
final cos = Math.cos;

void main() {
  testWidgets('Demo runs', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Sprung Demo'), findsOneWidget);
  });

  test("critically", () {
    final sprung = Sprung(damped: Damped.critically);

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: 5e-3));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: 5e-3));
  });

  test("over", () {
    final sprung = Sprung(damped: Damped.over);

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: 5e-3));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: 5e-3));
  });

  test("under", () {
    final sprung = Sprung(damped: Damped.under);

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: 5e-3));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: 5e-3));
  });
}
