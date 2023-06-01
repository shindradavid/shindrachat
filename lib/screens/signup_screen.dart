// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:shindrachat/components/password_field.dart';
import 'package:shindrachat/components/custom_text_field.dart';
import 'package:shindrachat/components/phoneNumberField.dart';
import 'package:shindrachat/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  var termsAndConditionsConsent = false;

  var name = "";
  var phoneNumber = "";
  var passwordOne = "";
  var passwordTwo = "";

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordOneController = TextEditingController();
  var passwordTwoController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree
    nameController.dispose();
    phoneNumberController.dispose();
    passwordOneController.dispose();
    passwordTwoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        name: 'Name',
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some cool text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.0),
                      PhoneNumberField(
                          name: 'Phone number',
                          controller: phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some cool text';
                            }
                            return null;
                          }),
                      SizedBox(height: 24.0),
                      PasswordField(
                        name: 'Password',
                        controller: passwordOneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some cool text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.0),
                      PasswordField(
                        name: 'Confirm password',
                        controller: passwordTwoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some cool text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        children: [
                          Checkbox(
                            value: termsAndConditionsConsent,
                            onChanged: (value) {
                              setState(() {
                                termsAndConditionsConsent =
                                    value ?? !termsAndConditionsConsent;
                              });
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: Text(
                              'By signing up, you agree to our terms and conditions',
                              style: TextStyle(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24.0),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print(passwordOneController.text);
                            print(passwordTwoController.text);
                            if (!termsAndConditionsConsent) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please accept to the terms and conditions',
                                  ),
                                ),
                              );
                            }
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          },
                          child: const Text('Sign up'),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
