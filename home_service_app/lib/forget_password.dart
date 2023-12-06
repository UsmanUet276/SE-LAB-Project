import 'package:flutter/material.dart';
//import 'package:home_service_app/home_screen.dart';
import 'package:home_service_app/sign_in.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping outside of text fields
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Forget Password?',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  TextFields(
                    // TextFields widget for email input
                    label: 'EMAIL',
                    icon: const Icon(Icons.email_outlined),
                    controller: _emailAddressController,
                  ),
                  const SizedBox(height: 10),
                  // Reset password button
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Navigate back
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('   RESET'),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_forward, size: 24.0),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        // Bottom navigation bar for navigation options
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Know Password?",
                style: TextStyle(
                    fontFamily: 'SFUIDisplay',
                    color: Colors.black,
                    fontSize: 15),
              ),
              TextButton(
                // Navigate to Sign In screen
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
                child: Text(
                  'Sign In',
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

// TextFields widget for reusable text input fields
class TextFields extends StatelessWidget {
  final Icon icon;
  final String label;
  TextEditingController controller;
  bool secureText;

  TextFields(
      {super.key,
      required this.icon,
      required this.label,
      required this.controller,
      this.secureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: secureText,
        style: const TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          prefixIcon: icon,
          labelStyle: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
