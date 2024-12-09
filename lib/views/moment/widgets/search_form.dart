import 'package:flutter/material.dart';
import 'package:myapp/core/resources/dimentions.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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