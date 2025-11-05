import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/my_button.dart'; // Relative import to your widget
void main() {
  testWidgets('MyButton displays text and responds to tap', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(MaterialApp(
      home: MyButton(text: 'Pay Now', onPressed: () { pressed = true; }),
    ));
    // Verify that the button displays the correct text
    expect(find.text('Pay Now'), findsOneWidget);
    // Simulate a button tap
    await tester.tap(find.byType(ElevatedButton));
    expect(pressed, isTrue);
  });
}
