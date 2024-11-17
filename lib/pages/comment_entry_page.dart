import 'package:flutter/material.dart';
import 'package:hello_world/models/comment.dart';
import 'package:hello_world/resources/dimentions.dart';
import 'package:nanoid2/nanoid2.dart';


import '../resources/colors.dart';

class CommentEntryPage extends StatefulWidget {
  const CommentEntryPage(
    {
      super.key, 
      required this.onSaved,
      required this.momentId,
      this.comment
      }
    );

  final Comment? comment;
  final String momentId; 
  final void Function({required Comment newComment, String? commentId}) onSaved;

  @override
  State<CommentEntryPage> createState() => _CommentEntryPageState();
}

class _CommentEntryPageState extends State<CommentEntryPage> {
  // Membuat object form global key
  final _formKey = GlobalKey<FormState>();
  final _dataComment = {};

  @override
  void initState() {
    if (widget.comment != null) {
      super.initState();
      _dataComment['comment'] = widget.comment?.comment;
      _dataComment['creator'] = widget.comment?.creator;
      _dataComment['created_at'] =widget.comment?.createdAt;
    }
  }

  String _getTitle()
  {
      if (widget.comment != null ) {
          return "Update Comment";
      }

      return "Create Comment";
  }

  // Membuat method untuk menyimpan data moment
  void _saveComment() {
    if (_formKey.currentState!.validate()) {
      // Menyimpan data inputan pengguna ke map _dataMoment
      _formKey.currentState!.save();
      // Membuat object moment baru
      final Comment comment  = Comment(
        comment: _dataComment['comment'],
        id: widget.comment?.id ?? nanoid(),
        creator: _dataComment['creator'],
        momentId: widget.momentId,
      );

      widget.onSaved(newComment: comment, commentId: comment.id);
      // Menutup halaman create moment
      Navigator.of(context).pop();
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSize),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Creator'),
                TextFormField(
                  initialValue: _dataComment['creator'] ?? "",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Moment creator',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment creator';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataComment['creator'] = newValue;
                    }
                  },
                ),
                const Text('Comment'),
                TextFormField(
                  initialValue: _dataComment['comment'] ?? "",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Comment description',
                    prefixIcon: const Icon(Icons.note),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter comment caption';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataComment['comment'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: largeSize),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: _saveComment,
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(height: mediumSize),
                SizedBox(
                  height: 50.0,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}