# sprung

Sprung is an easy-to-consume Curve that uses real physics equations to drive your animations.

## Easy to consume

```dart
AnimatedContainer(
  curve: Sprung(),
  /// ...
),
```

`Sprung()` also supports three damping curves, `Damped.under`, `Damped.critically`, and `Damped.over`.

```dart
AnimatedContainer(
  curve: Sprung(
    damped: Damped.under
  ),
  /// ...
),
```

_Note: Sprung is critically damped by default._

## Based on Physics

Using Newton's Second Law of Motion, Hooke's Law, and velocity based damping, we implement the following equation in three finite cases.

<img alt="m times x dot dot equals negative k times parenthesis x minus 1 close parenthesis minus c times x dot" src="https://raw.githubusercontent.com/lukepighetti/sprung/master/docs/equation.png" width="500">

## Believable motion

<img alt="demo of under, critically, and over damped Flutter curves" src="https://raw.githubusercontent.com/lukepighetti/sprung/master/docs/demo.gif" width="400">

## Reliable accuracy

Sprung exceeds Flutter specifications for curves by [guaranteeing](https://github.com/lukepighetti/sprung/blob/master/test/sprung_test.dart#L5) an error less than `1e-6`. This amounts to a `0.0019px` jitter at the beginning or end of a `1920px` move.

## Prior Art

https://medium.com/@dtinth/spring-animation-in-css-2039de6e1a03
