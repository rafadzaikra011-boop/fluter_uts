import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:food_order_app/main.dart';

void main() {
  testWidgets('onboarding opens the food orders list', (tester) async {
    await tester.pumpWidget(const FoodOrderApp());

    expect(find.text('All your favorites'), findsOneWidget);
    expect(
      find.text(
        'Get all your loved foods in one once place, '
        'you just place the one we do the rest',
      ),
      findsOneWidget,
    );

    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('Food Orders'), findsOneWidget);
    expect(find.text('Chicken Thai Biriyani'), findsOneWidget);
    expect(find.text('ID: 32053'), findsOneWidget);
    expect(find.text('\$60'), findsOneWidget);
  });

  testWidgets('Done updates an order status', (tester) async {
    await tester.pumpWidget(const FoodOrderApp());
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    await tester.tap(find.text('Done').first);
    await tester.pump();

    expect(find.text('Completed'), findsOneWidget);
  });

  testWidgets('the list scrolls to the remaining orders and Cancel works', (
    tester,
  ) async {
    await tester.pumpWidget(const FoodOrderApp());
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(find.text('Creamy Pasta Carbonara'), findsOneWidget);
    expect(find.text('Berry Pancake Special'), findsOneWidget);
    expect(find.text('ID: 32056'), findsOneWidget);
    expect(find.text('\$30'), findsOneWidget);

    await tester.tap(find.text('Cancel').last);
    await tester.pump();

    expect(find.text('Cancelled'), findsOneWidget);
  });

  testWidgets('onboarding fits a narrow mobile screen', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const FoodOrderApp());

    expect(tester.takeException(), isNull);
  });
}
