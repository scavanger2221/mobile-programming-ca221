import 'package:flutter/material.dart';
import 'package:hello_world/widgets/post_items.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key});

    @override
  Widget build(BuildContext context) {
     final items = List.generate(30, (index) => const PostItems());
     return SingleChildScrollView(
       child: Column(
          children: items,
       ),
     );
  }
}