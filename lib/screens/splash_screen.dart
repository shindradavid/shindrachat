import 'package:flutter/material.dart';
import 'package:shindrachat/global_colors.dart';

import 'package:shindrachat/components/full_width_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.accentColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Shindra Chat',
                style: TextStyle(
                  color: GlobalColors.onAccentColor,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    return GlobalColors.bgPrimary;
                  }),
                ),
                onPressed: () {},
                child: Text(
                  'Sign up',
                  style: TextStyle(color: GlobalColors.accentColor),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    return GlobalColors.bgPrimary;
                  }),
                ),
                onPressed: () {},
                child: Text(
                  'Log in',
                  style: TextStyle(color: GlobalColors.accentColor),
                ),
              ),
              fullWidthButton('Hello', GlobalColors.bgPrimary, () {})
            ],
          ),
        ),
      ),
    );
  }
}
