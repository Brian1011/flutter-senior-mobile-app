import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/auth/presentation/screens/registration_screen.dart';
import 'package:test_app/auth/presentation/screens/verification_screen.dart';
import 'package:test_app/auth/presentation/screens/welcome_screen.dart';
import 'package:test_app/feature/presentation/feature_screen.dart';
import 'package:test_app/feature/services/feature_service.dart';
import 'package:test_app/order/presentation/add_order_screen.dart';
import 'package:test_app/order/service/order_service.dart';
import 'package:test_app/splash_screen.dart';

import 'auth/services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => featureService),
        ChangeNotifierProvider(create: (_) => authService),
        ChangeNotifierProvider(create: (_) => orderService),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/register': (context) => RegistrationScreen(),
        '/verification': (context) => VerificationScreen(),
        '/add-order': (context) => AddOrderScreen(),
        '/home': (context) => ListFeaturesScreen(),
      },
    );
  }
}
