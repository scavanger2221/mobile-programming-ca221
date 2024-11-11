import 'package:flutter/material.dart';
import 'package:hello_world/models/moment.dart';
import 'package:hello_world/widgets/post_items.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key, required this.moments});

  final List<Moment> moments;

    @override
  Widget build(BuildContext context) {
    
     return SingleChildScrollView(
       child: Column(
            children: moments
            .map(
              (momentItem) => PostItems(moment: momentItem),
            )
            .toList(),
      ),
       );
  }
}