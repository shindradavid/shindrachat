import 'package:flutter/material.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
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
          print('new chat');
        },
      ),
    );
  }
}
