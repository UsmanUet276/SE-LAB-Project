import 'package:flutter/material.dart';

//import 'bottom_nav_bar.dart';
import 'custom_scaffold.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SingleChildScrollView(
        child: Center(child: Text('Services')),
      ),
      showBottomNavBar: true,
      initialIndex: 1,
    );
  }
}
