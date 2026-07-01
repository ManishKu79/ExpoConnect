import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expoconnect_pro/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ExpoConnectApp());
    expect(find.text('ExpoConnect Pro'), findsOneWidget);
  });
}