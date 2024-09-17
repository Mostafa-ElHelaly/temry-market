import 'package:flutter/material.dart';
import 'package:temry_market/presentation/views/main/main_view.dart';
import 'dart:async'; // For timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      // Navigate to HomeScreen after GIF ends
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/vedios/splash.gif', // Path to your GIF asset
          fit: BoxFit.cover, // Fit the image to the screen
        ),
      ),
    );
  }
}
