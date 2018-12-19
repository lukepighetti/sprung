import 'package:flutter_test/flutter_test.dart';

import 'package:sprung/sprung.dart';

final error = 1e-6;

void main() {
  test("critically", () {
    final sprung = Sprung(damped: Damped.critically);

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: error));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: error));
  });

  test("over", () {
    final sprung = Sprung(damped: Damped.over);

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: error));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: error));
  });

  test("under", () {
    final sprung = Sprung(damped: Damped.under);

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: error));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: error));
  });
}
