import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  // This widget is the root of your application.
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    ); // Animation Controller
    _animationController.forward();
    Timer(const Duration(seconds: 3), () {}); // Timer
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeOut,
              ) // Curved Animation
                  ),
              child: Image.asset('images/splashlogo.jpg', height: 150),
            ), //SacleTransition
            const SizedBox(
              height: 50,
            ), //SizedBox
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.linear,
              )),
              child: const Text(
                'HOME SERVICE APP',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black), //TextStyle,
              ), //Text
            ),
          ],
        ), //coloumn
      ), //center
    ); // Sacffold
  }
}
