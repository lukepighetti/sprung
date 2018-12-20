import "package:flutter/physics.dart";
import "package:flutter/widgets.dart";

class Sprung extends Curve {
  final double stiffness;
  final double damping;

  final SpringSimulation sim;

  Sprung({
    this.stiffness = 180,
    this.damping = 20,
  }) : this.sim = _sim(stiffness, damping);

  Sprung.over({
    this.stiffness = 180,
    this.damping = 28,
  }) : this.sim = _sim(stiffness, damping);

  Sprung.critically({
    this.stiffness = 180,
    this.damping = 20,
  }) : this.sim = _sim(stiffness, damping);

  Sprung.under({
    this.stiffness = 180,
    this.damping = 12,
  }) : this.sim = _sim(stiffness, damping);

  @override
  double transform(double t) => sim.x(t) - t * (1 - sim.x(1.0));
}

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
