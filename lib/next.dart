import "package:flutter/physics.dart";
import "package:flutter/widgets.dart";

/// **Preview API for Sprung**
///
/// A Curve that uses the Flutter Physics engine to drive realistic animations.
///
/// Exposes three customizable curves, [Sprung.underDamped], [Sprung.criticallyDamped], and [Sprung.overDamped].
///
/// [Sprung.underDamped] provides a poorly damped "springy" animation.
/// [Sprung.criticallyDamped] provides the most controlled damped spring animation.
/// [Sprung.overDamped] provides an over-damped animation, similar to an ease.

class Sprung extends Curve {
  final SpringSimulation sim;

  /// Provides a critically damped spring by default, with an easily overrideable damping value.
  Sprung([double damping = 20]) : this.sim = _sim(180, damping);

  /// Provides an **under damped** spring by default, with overridable stiffness and damping.
  Sprung.underDamped({
    double stiffness = 180,
    double damping = 12,
  }) : this.sim = _sim(stiffness, damping);

  /// Provides a **critically damped** spring by default, with overridable stiffness and damping.
  Sprung.criticallyDamped({
    double stiffness = 180,
    double damping = 20,
  }) : this.sim = _sim(stiffness, damping);

  /// Provides an **over damped** spring by default, with overridable stiffness and damping.
  Sprung.overDamped({
    double stiffness = 180,
    double damping = 28,
  }) : this.sim = _sim(stiffness, damping);

  /// Allows the creation of a spring with custom stiffness and damping.
  ///
  /// A stiffness of `180` and damping of `20` creates a critically damped spring.
  Sprung.custom({
    @required double stiffness,
    @required double damping,
  }) : this.sim = _sim(stiffness, damping);

  /// Returns the position from the simulator and corrects the final output `x(1.0)` for tight tolerances.
  @override
  double transform(double t) => sim.x(t) + t * (1 - sim.x(1.0));
}

/// Generates a new simulator to reduce boilerplate.
_sim(double stiffness, double damping) => SpringSimulation(
      SpringDescription(
        mass: 1,
        stiffness: stiffness,
        damping: damping,
      ),
      0.0,
      1.0,
      0.0,
    );
