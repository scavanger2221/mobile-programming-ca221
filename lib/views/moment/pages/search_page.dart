import 'package:flutter/material.dart';
import 'package:myapp/models/moment.dart';
import 'package:myapp/core/resources/dimentions.dart';
import 'package:myapp/views/moment/widgets/post_cover.dart';
import 'package:myapp/views/moment/widgets/search_and_filter.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.moments});

  final List<Moment> moments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchAndFilter(
              onSubmit: (query) {} ,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //   child: TextField(
          //     autofocus: true,
          //     decoration: InputDecoration(       
          //       labelText: "Cari moment...",
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(largeSize)
          //       ),
          //       prefixIcon: const Icon(Icons.search)
          //     ),
          //   ),
          // ),
              const SizedBox(
            height: largeSize,
          ),
           Expanded(
             child: GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
                primary: false,
                  itemBuilder: (context, index) => PostCover(imageUrl:moments[index].imageUrl),
                  itemCount: moments.length,
              ),
                 ),
        ]),
    );
  }
}