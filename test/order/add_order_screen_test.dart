import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/main.dart';

void main() {
  testWidgets('Test add order screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('Fill Below to Order'), findsOneWidget);
    expect(find.text('Pickup Point'), findsOneWidget);
    expect(find.text('Drop-off Point'), findsOneWidget);
    expect(find.text('Est. Weight (KGs)'), findsOneWidget);
    expect(find.text('Delivery Instructions'), findsOneWidget);
    expect(find.text('Confirm & order & trip'), findsOneWidget);

    expect(
        find.byWidget(TextFormField(), skipOffstage: false), findsNWidgets(4));
    expect(find.byWidget(TextButton(), skipOffstage: false), findsOneWidget);

    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
  });
}
