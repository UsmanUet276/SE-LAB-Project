import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'splash_screen.dart';
//import 'welcome_screen.dart';
import 'login_screen.dart';
//import 'sign_in.dart';
//import 'sign_up.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      //home: WelcomeScreen()
      home: LoginScreen(),
      //home: SignIn()
      //home: SignUp()
    );
  }
}
