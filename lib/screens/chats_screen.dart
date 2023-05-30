import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Chats'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        icon: const Icon(Icons.add),
        label: Text('New chat'),
        onPressed: () {
          print('new chat');
        },
      ),
    );
  }
}
