// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

typedef StringOrNull = String? Function(String?);

class PasswordField extends StatefulWidget {
  final String name;
  final TextEditingController controller;
  final StringOrNull validator;

  const PasswordField({
    super.key,
    required this.name,
    required this.controller,
    required this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;
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
            obscureText: !passwordVisible,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8.0),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                )),
            keyboardType: TextInputType.text,
            // The validator receives the text that the user has entered.
            validator: widget.validator,
          ),
        ],
      )
    ]);
  }
}
