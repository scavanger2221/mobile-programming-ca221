import 'package:flutter/material.dart';
import 'package:hello_world/resources/dimentions.dart';

class MomentCommentPage extends StatelessWidget {
  MomentCommentPage({super.key});

  final TextEditingController _creatorController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  void _submitComment() {
    final creator = _creatorController.text.trim();
    final comment = _commentController.text.trim();

    if (creator.isNotEmpty && comment.isNotEmpty) {
      // Handle the comment submission logic here
      print("Creator: $creator");
      print("Comment: $comment");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Comment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Creator",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: smallSize),
            TextField(
              controller: _creatorController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Moment creator",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(smallSize),
                ),
              ),
            ),
            const SizedBox(height: mediumSize),
            const Text(
              "Comment",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: smallSize),
            TextField(
              controller: _commentController,
              maxLines: 4,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.description),
                hintText: "Comment description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(smallSize),
                ),
              ),
            ),
            const SizedBox(height: largeSize),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submitComment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(vertical: mediumSize),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(extraLargeSize),
                      ),
                    ),
                    child: const Text("Send", style: TextStyle(color: Colors.white70),),
                  ),
                ),
                const SizedBox(width: mediumSize),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.brown,
                      side: BorderSide(color: Colors.brown),
                      padding: const EdgeInsets.symmetric(vertical: mediumSize),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(extraLargeSize),
                      ),
                    ),
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}