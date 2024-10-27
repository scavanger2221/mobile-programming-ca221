import 'package:flutter/material.dart';
import 'package:hello_world/colors.dart';
import 'package:hello_world/widgets/contact_list.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          elevation: 0,
          title: const Text(
            'Whatsapp',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 4,
            labelColor: tabColor,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold
            ),
            tabs: [
            Tab(
              text: 'Chats',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Calls',
            )
          ]),
        ),
        body: const ContactList(),
      ),
    );
  }
}
