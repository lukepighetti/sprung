import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets('Demo runs', (WidgetTester tester) async {
    await tester.pumpWidget(SprungDemoApp());
    expect(find.text('Sprung Demo'), findsOneWidget);
  });
}
