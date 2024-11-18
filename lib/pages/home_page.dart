import 'package:flutter/material.dart';
import 'package:hello_world/models/book.dart';
// import 'package:hello_world/resources/dimentions.dart';
import 'package:hello_world/widgets/book_cover.dart';
// import 'package:hello_world/widgets/search_and_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
             child: GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
                primary: false,
                  itemBuilder: (context, index) => BookCover(book:books[index]),
                  itemCount: books.length,
              ),
                 ),
        ]),
    );
  }
}