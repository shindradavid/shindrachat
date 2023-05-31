import 'package:flutter/material.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  String phoneNumber = '';

  invitePersonDialog(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invite a friend'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              keyboardType: TextInputType.phone,
              controller: phoneNumberController,
            ),
            actions: [
              TextButton(
                // style: ButtonStyle(
                //   backgroundColor: Colors.blue
                // ),
                onPressed: () {
                  Navigator.of(context)
                      .pop(phoneNumberController.text.toString());
                },
                child: Text('Send invite'),
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('People'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        icon: const Icon(Icons.add),
        label: Text('Invite'),
        onPressed: () {
          invitePersonDialog(context);
        },
      ),
    );
  }
}
