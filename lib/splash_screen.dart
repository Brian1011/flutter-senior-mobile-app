import 'package:flutter/material.dart';
import 'package:test_app/auth/services/auth_service.dart';
import 'package:test_app/order/service/order_service.dart';

import 'database_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  initializeDatabase() async {
    await db.init();
    await authService.init();
    await orderService.init();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (authService.phoneNumber != null) {
      Navigator.of(context).pushReplacementNamed("/home");
    } else {
      Navigator.of(context).pushReplacementNamed('/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: const Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
