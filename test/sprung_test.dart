import 'package:flutter_test/flutter_test.dart';

import 'package:sprung/sprung.dart';

const error = 1e-6;

testSprung(Sprung sprung) {
  expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: error));
  expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: error));
}

void main() {
  test("default", () {
    testSprung(Sprung());
  });

  test("default with custom damping", () {
    testSprung(Sprung(20));
  });

  test("custom", () {
    testSprung(Sprung.custom(damping: 20, stiffness: 180, mass: 1.0));
  });

  test("criticallyDamped", () {
    testSprung(Sprung.criticallyDamped);
  });

  test("overDamped", () {
    testSprung(Sprung.overDamped);
  });

  test("underDamped", () {
    testSprung(Sprung.underDamped);
  });
}
