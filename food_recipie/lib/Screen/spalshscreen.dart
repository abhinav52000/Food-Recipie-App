import 'package:flutter/material.dart';
import 'package:food_recipie/Screen/login_registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const id = 'Splash Screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  navigateToHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );

    // ignore: use_build_context_synchronously
    Navigator.popAndPushNamed(context, LoginRegistration.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('Asset/splashlogo.png')),
    );
  }
}
