import 'package:flutter_test/flutter_test.dart';

import 'package:sprung/next.dart';

final error = 1e-6;

void main() {
  test("critically", () {
    final sprung = Sprung.criticallyDamped();

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: error));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: error));
  });

  test("over", () {
    final sprung = Sprung.overDamped();

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: error));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: error));
  });

  test("under", () {
    final sprung = Sprung.underDamped();

    expect(sprung.transform(1.0), moreOrLessEquals(1.0, epsilon: error));
    expect(sprung.transform(0.0), moreOrLessEquals(0.0, epsilon: error));
  });
}
