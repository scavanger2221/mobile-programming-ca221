import 'package:flutter/material.dart';
import 'package:hello_world/models/comment.dart';
import 'package:hello_world/pages/comment_entry_page.dart';
import 'package:intl/intl.dart';
import 'package:faker/faker.dart' as faker;
import 'package:nanoid2/nanoid2.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key, required this.momentId});
  final String momentId;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  Map<String, Comment> _comments = {};
  final _faker = faker.Faker();
  final _dateFormat = DateFormat('dd MMM yyyy');

  @override
void initState() {
  super.initState();
  _comments = Map.fromEntries(
    List.generate(5, (_) {
      final id = nanoid(); // Generate the ID once
      return MapEntry(
        id,
        Comment(
          id: id,
          creator: _faker.person.name(),
          comment: _faker.lorem.sentence(),
          createdAt: _faker.date.dateTime(),
          momentId: widget.momentId,
        ),
      );
    }),
  );
}

  void _saveComment({required Comment newComment, String? commentId}) {
    if (commentId == null) {
      setState(() {
        _comments[newComment.id] = newComment;
      });
    }

    setState(() {
       _comments[commentId ?? ""] = newComment;
    });
    //handle update
  }

      void _deleteComment({required String commentId})
    {
      setState(() {
        _comments.remove(commentId);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _comments.values
              .map((comment) => ListTile(
                    title: Text(comment.creator),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment.comment),
                        const SizedBox(height: 4),
                        Text(
                          _dateFormat.format(comment.createdAt),
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 10.0),
                        ),
                      ],
                    ),
                    leading: const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://i.pravatar.cc/150'),
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Edit') {
                          // onUpdate(comment.id);
                        } else if (value == 'Delete') {
                               showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Comment'),
                            content: const Text('Are you sure you want to delete this comment?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  _deleteComment(commentId: comment.id);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Sure'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'Edit',
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return CommentEntryPage(
                              onSaved: _saveComment,
                              momentId: widget.momentId,
                              comment: comment,
                            );
                          })),
                          child: const Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 'Delete',
                          child: Text('Delete'),
                    
                        ),
                      ],
                      child: const Icon(Icons.more_vert),
                    ),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CommentEntryPage(
              onSaved: _saveComment,
              momentId: widget.momentId,
            );
          }));
        },
        child: const Icon(Icons.comment),
      ),
    );
  }
}
