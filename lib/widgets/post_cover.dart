import 'package:flutter/material.dart';
import 'package:hello_world/resources/dimentions.dart';

class PostCover extends StatelessWidget {
  const PostCover({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(mediumSize),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(extraLargeSize),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
