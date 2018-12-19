import 'package:flutter/widgets.dart';
import 'dart:math' as Math;

final e = Math.exp;
final sin = Math.sin;
final cos = Math.cos;
final sqrt = Math.sqrt;

enum Damped {
  over,
  critically,
  under,
}

class Sprung extends Curve {
  final Damped damped;

  Sprung({
    this.damped = Damped.critically,
  });

  @override
  double transform(double t) {
    c28(t) => (5 / 4) * e(-18 * t) - (9 / 4) * e(-10 * t) + 1;

    c20(t) =>
        -(1 / 2) * sqrt(5) * e(-10 * t) * sin(4 * sqrt(5) * t) -
        e(-10 * t) * cos(4 * sqrt(5) * t) +
        1;

    c12(t) =>
        -0.5 * e(-6 * t) * (-2 * e(6 * t) + sin(12 * t) + 2 * cos(12 * t));

    switch (this.damped) {
      case Damped.over:
        return c28(t);
      case Damped.critically:
        return c20(t);
      case Damped.under:
        return c12(t);
      default:
        return c20(t);
    }
  }
}
