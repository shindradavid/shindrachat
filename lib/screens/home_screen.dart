import 'package:flutter/material.dart';

// screens
import 'package:shindrachat/screens/chats_screen.dart';
import 'package:shindrachat/screens/people_screen.dart';
import 'package:shindrachat/screens/groups_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shindra Chat'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: 'People'),
            Tab(text: 'Chats'),
            Tab(text: 'Groups')
          ]),
        ),
        body: const TabBarView(children: [
          PeopleScreen(),
          ChatsScreen(),
          GroupsScreen(),
        ]),
      ),
    );
  }
}
