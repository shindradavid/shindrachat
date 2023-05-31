import 'package:flutter/material.dart';

import 'package:shindrachat/global_colors.dart';

typedef VoidCallback = void Function();

Widget fullWidthButton(String text, Color color, VoidCallback onPressed) {
  return TextButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        return color;
      }),
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(color: GlobalColors.accentColor),
    ),
  );
}
