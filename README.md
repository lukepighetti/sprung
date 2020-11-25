# sprung

Sprung is an easy-to-consume Curve that uses real physics equations to drive your animations.

## Easy to consume

`Sprung` has three opinionated curves, `Sprung.underDamped`, `Sprung.criticallyDamped`, and `Sprung.overDamped`. This is the best way to get started.

```dart
AnimatedContainer(
  curve: Sprung.underDamped,
  /// ...
),
```

When you want more fine control, use the default constructor which is critically damped, with overridable damping value.

```dart
AnimatedContainer(
  /// Critically damped by default
  curve: Sprung(),
  /// ...
),
```

```dart
AnimatedContainer(
  /// Easily adjust damping value
  curve: Sprung(16),
  /// ...
),
```

To build a fully custom spring simulation, use `Sprung.custom`. This allows you to define the spring's damping and stiffness, as well as the mass' mass and initial velocity.

```dart
AnimatedContainer(
  /// Build a custom spring
  curve: Sprung.custom(
    damping: 20,
    stiffness: 180,
    mass: 1.0,
    velocity: 0.0,
  ),
  /// ...
),
```

## Based on Physics

Using Flutter's physics engine which leverages Newton's Second Law of Motion, Hooke's Law, and velocity based damping, we implement the following equation to create realistic spring animations.

<img alt="m times x dot dot equals negative k times parenthesis x minus 1 close parenthesis minus c times x dot" src="https://raw.githubusercontent.com/lukepighetti/sprung/master/doc/equation.png" width="500">

## Believable motion

<img alt="demo of under, critically, and over damped Flutter curves" src="https://raw.githubusercontent.com/lukepighetti/sprung/master/doc/demo.gif" width="400">

## Reliable accuracy

Sprung exceeds Flutter specifications for curves by [guaranteeing](https://github.com/lukepighetti/sprung/blob/master/test/sprung_test.dart#L5) an error less than `1e-6`. This amounts to a `0.0019px` jitter at the beginning or end of a `1920px` move.
