import 'package:flutter/material.dart';
import 'package:home_service_app/home_screen.dart';

import 'sign_in.dart';
import 'sign_up.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/login_screen_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.darken),
            ),
          ),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 120, 5, 20),
            ),
            Image.asset(
              'images/logo_black_white.png',
              height: 150,
            ),
            const SizedBox(height: 100),
            Button(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              text: 'SIGN UP',
            ),
            const SizedBox(height: 45),
            Button(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              text: 'SIGN IN',
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, right: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 26,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  String text;
  final void Function() onPressed;
  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
          child: Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 94, 92, 92), fontSize: 22),
          )),
    );
  }
}
