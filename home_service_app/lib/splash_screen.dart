import 'package:flutter/material.dart';
import 'dart:async';
//import 'login_screen.dart';
import 'welcome_screen.dart';

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
    // Initialize Animation Controller for controlling the animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    ); 
     // Start the animation
    _animationController.forward();
    // Set a timer for 3 seconds (in this case, an empty function is called after 3 seconds)
    Timer(const Duration(seconds: 3), () {}); // Timer
  }

  // This widget is the root of your application.
  @override
    // Build the UI for the SplashScreen
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // Center the content on the screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "Skip" button at the bottom right
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  //navigate to home screen
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ), 
             // Animated logo using ScaleTransition
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
