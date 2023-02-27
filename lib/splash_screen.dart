import 'package:flutter/material.dart';
import 'package:test_app/auth/services/auth_service.dart';

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
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed('/welcome');
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
