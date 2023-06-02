import 'package:flutter/material.dart';

import 'package:shindrachat/global_colors.dart';

typedef VoidCallback = void Function();

Widget FullWidthButton(String text, Color color, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      // style: ButtonStyle(
      //   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      //       (Set<MaterialState> states) {
      //     return color;
      //   }),
      // ),
      onPressed: onPressed,
      child: Text(
        text,
      ),
    ),
  );
}
