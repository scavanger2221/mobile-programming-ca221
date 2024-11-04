import 'package:flutter/material.dart';
import 'package:hello_world/resources/dimentions.dart';

class PostCover extends StatelessWidget {
  const PostCover({super.key});

  @override
  Widget build(BuildContext context) {
    return 
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(extraLargeSize),
                  image: const DecorationImage(
                    image: NetworkImage("https://picsum.photos/200"),
                    fit: BoxFit.cover
                  )
                ),
              );
  }
}