import 'package:flutter/material.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Groups'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        icon: const Icon(Icons.add),
        label: Text('New group'),
        onPressed: () {
          print('new chat');
        },
      ),
    );
  }
}
