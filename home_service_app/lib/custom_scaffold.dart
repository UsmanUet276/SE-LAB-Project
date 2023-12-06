import 'package:flutter/material.dart';
import 'package:home_service_app/bottom_nav_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body; // The main content of the scaffold
  final bool
      showBottomNavBar; // Flag to determine if the bottom navigation bar should be shown
  final int initialIndex; // Initial index for the bottom navigation bar
  const CustomScaffold({
    super.key,
    required this.body,
    this.showBottomNavBar = false,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget with specified properties
    return Scaffold(
      body: body,
      bottomNavigationBar: // Display bottom navigation bar if showBottomNavBar is true
          showBottomNavBar ? BottomNavBar(initialIndex: initialIndex) : null,
    );
  }
}
