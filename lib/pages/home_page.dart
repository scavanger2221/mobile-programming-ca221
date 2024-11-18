import 'package:flutter/material.dart';
import 'package:hello_world/models/book.dart';
// import 'package:hello_world/resources/dimentions.dart';
import 'package:hello_world/widgets/book_cover.dart';
// import 'package:hello_world/widgets/search_and_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.books,
      required this.onDelete,
      required this.onUpdate});

  final List<Book> books;
  final Function onDelete;
  final Function onUpdate;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            primary: false,
            itemBuilder: (context, index) =>
                BookCover(
                  book: widget.books[index], 
                  onDelete: widget.onDelete,
                  onUpdate: widget.onUpdate,
                  ),
            itemCount: widget.books.length,
          ),
        ),
      ]),
    );
  }
}
