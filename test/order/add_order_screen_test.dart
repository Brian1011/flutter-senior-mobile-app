import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/order/presentation/add_order_screen.dart';

void main() {
  group('AddOrderScreen widgets', () {
    // check for title
    testWidgets('should have a title', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.text('Fill Below to Order'), findsOneWidget);
    });

    // check for icon
    testWidgets('should have a menu icon', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    // should have a form
    testWidgets('should have a form', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.byType(Form), findsOneWidget);
    });

    // should have 4 text fields
    testWidgets('should have 4 text fields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.byType(TextFormField), findsNWidgets(4));
    });

    // should have a text field for pickup point
    testWidgets('should have a text field for pickup point',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.byKey(Key('pickupPoint')), findsOneWidget);
    });

    // should have a text field for drop point
    testWidgets('should have a text field for drop point',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.byKey(Key('dropPoint')), findsOneWidget);
    });

    // should have a text field for drop point
    testWidgets('should have a text field for weight',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.byKey(Key('weight')), findsOneWidget);
    });

    // should have a text field for delivery instructions
    testWidgets('should have a text field for delivery instructions',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.byKey(Key('deliveryInstructions')), findsOneWidget);
    });

    // check for labels
    testWidgets('should have labels for text fields',
        (WidgetTester tester) async {
      // Build app and trigger a frame.
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.text('Pickup Point'), findsOneWidget);
      expect(find.text('Drop-off Point'), findsOneWidget);
      expect(find.text('Est. Weight (KGs)'), findsOneWidget);
      expect(find.text('Delivery Instructions'), findsOneWidget);
    });

    // check for the button
    testWidgets('should have a button', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.byType(TextButton), findsOneWidget);
    });

    // check for the button text
    testWidgets('should have a button text', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AddOrderScreen()));
      expect(find.text('Confirm & order & trip'), findsOneWidget);
    });
  });
}
