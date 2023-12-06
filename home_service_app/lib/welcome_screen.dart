import 'package:flutter/material.dart';
//import 'home_screen.dart';
import 'login_screen.dart';
//import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  // This widget is the root of your application.
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(
        title: 'Pick Any Service You Want',
        description: 'All services available at one platform',
        image: 'images/welcome.png'),
    WelcomeSlider(
        title: 'Pick Us, and we will be there.',
        description: 'Save money on your repair projects.',
        image: 'images/welcome1.jpg'),
    WelcomeSlider(
        title: 'Quality in the name. Trust in the relationship.',
        description: 'Complete repairs for your home.',
        image: 'images/welcome2.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                 // "Skip" button at the top right
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to the LoginScreen when the "Skip" button is pressed
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                 // PageView for displaying welcome sliders
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: welcomeSlider.length,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      final item = welcomeSlider[index];
                      return Column(
                        children: [
                          // Image for the welcome slider
                          Image.asset(
                            item.image,
                            height: 350,
                          ),
                          const SizedBox(height: 10),
                          // Title text for the welcome slider
                          Text(item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28)),
                          const SizedBox(height: 5),
                          // Description text for the welcome slider
                          Text(
                            item.description,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 94, 92, 92),
                                fontSize: 20),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                // Indicator dots for each welcome slider
                Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: _currentPage == index ? 30 : 10,
                        decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.red
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
        // Floating Action Button for navigation
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            if (_currentPage < welcomeSlider.length - 1) {
               // Move to the next page if available
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            } else {
              // Navigate to the LoginScreen when the last page is reached
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
          },
          child: _currentPage != welcomeSlider.length - 1
              ? const Icon(Icons.arrow_forward)
              : const Icon(Icons.done),
        ),
      ),
    );
  }
}
// Class representing a Welcome Slider with title, description, and image
class WelcomeSlider {
  final String title;
  final String description;
  final String image;

  WelcomeSlider(
      {required this.title, required this.description, required this.image});
}
