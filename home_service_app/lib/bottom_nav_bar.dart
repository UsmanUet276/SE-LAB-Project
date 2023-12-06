import 'package:flutter/material.dart';
import 'package:home_service_app/home_screen.dart';

import 'my_account.dart';
import 'selected_services.dart';
//import 'services.dart';
import 'services_extra.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

// Method to handle bottom navigation item tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Switch based on the selected index to navigate to the respective screen
    switch (index) {
      case 0:
        _navigateToRoute(context, '/home', HomeScreen());
        break;
      case 1:
        _navigateToRoute(context, '/servicesprovider', ServiceProvider());
        break;
      case 2:
        _navigateToRoute(context, '/myaccount', MyAccount());
        break;
      case 3:
        _navigateToRoute(context, '/selectedservices', SelectedServices());
        break;
    }
  }

  // Method to navigate to the specified route or replace the current route
  void _navigateToRoute(context, String routeName, Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routeName;

    if (routeExists) {
      // If the route already exists, pop until reaching that route
      Navigator.popUntil(context, ModalRoute.withName(routeName));
    } else {
      // If the route doesn't exist, push the new route and replace the current one
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Return the BottomNavigationBar widget with specified properties
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[300],
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,
                color: _selectedIndex == 0 ? Colors.blue[300] : Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service_outlined,
                color: _selectedIndex == 1 ? Colors.blue[300] : Colors.black),
            label: 'Services Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined,
                color: _selectedIndex == 2 ? Colors.blue[300] : Colors.black),
            label: 'My Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_bottom_outlined,
                color: _selectedIndex == 3 ? Colors.blue[300] : Colors.black),
            label: 'Selected Service',
          ),
        ]);
  }
}
