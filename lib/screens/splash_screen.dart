import 'package:flutter/material.dart';
import 'package:shindrachat/global_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shindrachat/screens/signup_screen.dart';
import 'package:shindrachat/screens/login_screen.dart';
import 'package:shindrachat/screens/home_screen.dart';

import 'package:shindrachat/components/full_width_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // check();
  }

  check() async {
    var user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 0.0,
                ),
                // TextButton(
                //   style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                //         (Set<MaterialState> states) {
                //       return GlobalColors.bgPrimary;
                //     }),
                //   ),
                //   onPressed: () {},
                //   child: Text(
                //     'Log in',
                //     style: TextStyle(color: GlobalColors.accentColor),
                //   ),
                // ),
                Column(
                  children: [
                    Image.asset(
                      'assets/Logo.jpg',
                      fit: BoxFit.contain,
                      height: 150.0,
                      width: 150.0,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Shindra Chat',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'The world\'s fastest chat application.',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    FullWidthButton(
                      'Sign up',
                      GlobalColors.bgPrimary,
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                    ),
                    FullWidthButton(
                      'Log in',
                      GlobalColors.bgPrimary,
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
