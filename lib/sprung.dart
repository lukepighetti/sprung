import 'package:flutter/widgets.dart';
import 'dart:math' as Math;

/// The damping curves available for use with [Sprung]
enum Damped {
  /// An over-damped spring. Similar to an ease transition.
  over,

  /// A well controlled spring with proper damping.
  critically,

  /// A poorly controlled spring with insufficient damping.
  under,
}

/// A Curve that uses real physics equations to drive realistic animations.
///
/// Uses three curves, [Damped.under], [Damped.critically], and [Damped.over].
///
/// [Damped.under] provides the most "springy" animation.
/// [Damped.critically] provides the most controlled damped spring animation.
/// [Damped.over] provides an over-damped animation, like an ease but more realistic.

class Sprung extends Curve {
  /// Detrmines which damping curve to use. Default is [Damped.critically]
  final Damped damped;

  Sprung({
    this.damped = Damped.critically,
  });

  @override
  double transform(double t) {
    final e = Math.exp;
    final sin = Math.sin;
    final cos = Math.cos;
    final sqrt = Math.sqrt;

    c28(t) => (5 / 4) * e(-18 * t) - (9 / 4) * e(-10 * t) + 1;

    c20(t) =>
        -(1 / 2) * sqrt(5) * e(-10 * t) * sin(4 * sqrt(5) * t) -
        e(-10 * t) * cos(4 * sqrt(5) * t) +
        1;

    c12(t) =>
        -0.5 * e(-6 * t) * (-2 * e(6 * t) + sin(12 * t) + 2 * cos(12 * t));

    switch (this.damped) {
      case Damped.over:
        return c28(t) + t * (1 - 0.999897869195509);
      case Damped.critically:
        return c20(t) + t * (1 - 1.0000167968177829);
      case Damped.under:
        return c12(t) + t * (1 - 0.9985733108072201);
      default:
        return c20(t);
    }
  }
}
