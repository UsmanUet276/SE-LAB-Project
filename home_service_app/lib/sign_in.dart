import 'package:flutter/material.dart';
import 'package:home_service_app/forget_password.dart';
import 'package:home_service_app/home_screen.dart';

import 'sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please sign in to continue.',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _emailAddressController,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'EMAIL',
                    prefixIcon: Icon(Icons.email_outlined),
                    labelStyle: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'PASSWORD',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgetPassword()));
                      },
                      child: Text(
                        'FORGOT',
                        style: TextStyle(color: Colors.blue[300]),
                      ),
                    ),
                    labelStyle: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('  LOGIN'),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward, size: 24.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have account?",
                style: TextStyle(
                    fontFamily: 'SFUIDisplay',
                    color: Colors.black,
                    fontSize: 15),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontFamily: 'SFUIDisplay',
                      color: Colors.blue[300],
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
