import 'package:flutter/material.dart';
import 'package:hello_world/models/book.dart';
import 'package:hello_world/resources/dimentions.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.book, required this.onDelete, required this.onUpdate});
  final Book book;
  final Function onDelete;
    final Function onUpdate;

   @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Adjusted to better fit an image with details
      child: Stack(
        children: [ 
          Container(
          margin: const EdgeInsets.all(mediumSize),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(largeSize),
            image: DecorationImage(
              image: NetworkImage(book.albumImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Book details container
              Container(
                padding: const EdgeInsets.all(smallSize),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6), // Semi-transparent background
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(extraLargeSize),
                    bottomRight: Radius.circular(extraLargeSize),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        book.album,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                           Text(
                        book.artist,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        book.releaseYear.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
         // Edit and Delete buttons
          Positioned(
            top: 8,
            right: 8,
             child: Padding(
               padding: const EdgeInsets.all(4.0),
               child: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    onUpdate(book.id);
                  } else if (value == 'delete') {
                    onDelete(book.id);
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                    ),
                  ),
                ],
                icon: const Icon(Icons.more_vert, color: Colors.white),
                           ),
             ),
          ),
        ]
      )
          
    );
  }
}