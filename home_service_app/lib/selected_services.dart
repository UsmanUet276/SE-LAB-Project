import 'package:flutter/material.dart';

//import 'bottom_nav_bar.dart';
import 'custom_scaffold.dart';

class SelectedServices extends StatelessWidget {
  const SelectedServices({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SingleChildScrollView(
        child: Center(child: Text('Selected Services')),
      ),
      showBottomNavBar: true,
      initialIndex: 3,
    );
  }
}
