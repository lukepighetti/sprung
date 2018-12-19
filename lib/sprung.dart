import 'package:flutter/widgets.dart';
import 'dart:math' as Math;

enum Damped {
  over,
  critically,
  under,
}

class Sprung extends Curve {
  final Damped damped;
  Sprung({this.damped});

  @override
  double transform(double t) {
    final e = Math.exp;
    final sin = Math.sin;
    final cos = Math.cos;
    final sqrt = Math.sqrt;

    over(t) =>
        -13 * e(-13 * t) * sin(sqrt(11) * t) / sqrt(11) -
        e(-13 * t) * cos(sqrt(11) * t) +
        1;

    critically(t) =>
        -0.5 * e(-6 * t) * (-2 * e(6 * t) + sin(12 * t) + 2 * cos(12 * t));

    under(t) =>
        (2 * e(-4 * t) * sin(2 * sqrt(41) * t) / sqrt(41)) -
        e(-4 * t) * cos(2 * sqrt(41) * t) +
        1;

    switch (this.damped) {
      case Damped.over:
        return over(t);
      case Damped.critically:
        return critically(t);
      case Damped.under:
        return under(t);
      default:
        return critically(t);
    }
  }
}
