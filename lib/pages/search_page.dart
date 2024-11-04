import 'package:flutter/material.dart';
import 'package:hello_world/resources/dimentions.dart';
import 'package:hello_world/widgets/post_cover.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(20, (index) => const PostCover());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(       
              labelText: "Cari moment...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(largeSize)
              ),
              prefixIcon: const Icon(Icons.search)
            ),
          ),
        ),
         Expanded(
           child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: items
               ),
         )
      ]);
  }
}