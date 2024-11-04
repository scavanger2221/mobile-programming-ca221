import 'package:flutter/material.dart';
import 'package:hello_world/resources/dimentions.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(81.0),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(       
              labelText: "Cari moment...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(mediumSize)
              ),
              prefixIcon: const Icon(Icons.search)
            ),
          ),
        );
  }
}