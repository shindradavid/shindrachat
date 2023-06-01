// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

typedef StringOrNull = String? Function(String?);

class CustomTextField extends StatefulWidget {
  final String name;
  final TextEditingController controller;
  final StringOrNull validator;

  const CustomTextField({
    super.key,
    required this.name,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name),
          SizedBox(height: 8.0),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(8.0),
            ),
            keyboardType: TextInputType.text,
            // The validator receives the text that the user has entered.
            validator: widget.validator,
          ),
        ],
      )
    ]);
  }
}
