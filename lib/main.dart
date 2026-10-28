import 'package:flutter/material.dart';

import 'onboarding_page.dart';
import 'orders_page.dart';

void main() {
  runApp(const FoodOrderApp());
}

class FoodOrderApp extends StatelessWidget {
  const FoodOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFF36B32);

    return MaterialApp(
      title: 'Foodie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: orange,
          primary: orange,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: OnboardingPage(
        onContinue: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const OrdersPage(),
            ),
          );
        },
      ),
    );
  }
}
