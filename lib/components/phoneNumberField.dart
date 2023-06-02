// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

typedef StringOrNull = String? Function(String?);

class PhoneNumberField extends StatefulWidget {
  final String name;
  final TextEditingController controller;
  final StringOrNull validator;

  const PhoneNumberField({
    super.key,
    required this.name,
    required this.controller,
    required this.validator,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String initialCountry = 'UG';
  PhoneNumber number = PhoneNumber(isoCode: 'UG');

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name),
          SizedBox(height: 8.0),
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              print(value);
            },
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            hintText: null,
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: widget.controller,
            formatInput: true,
            inputDecoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              border: OutlineInputBorder(),
            ),
            keyboardType:
                TextInputType.numberWithOptions(signed: false, decimal: false),
            inputBorder: OutlineInputBorder(),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some cool text';
              }
              return null;
            },
          ),
        ],
      )
    ]);
  }
}
