import 'package:flutter/material.dart';
import 'package:myapp/views/comment/pages/comment_page.dart';
import 'package:myapp/core/resources/dimentions.dart';
import 'package:myapp/views/moment/widgets/post_action.dart';
import 'package:myapp/views/moment/widgets/post_title.dart';


import '../../../models/moment.dart';

class PostItems extends StatelessWidget {
  const PostItems({
    super.key,
    required this.moment,
    required this.onUpdate,
    required this.onDelete,
  });

  final Moment moment;
  final Function(String id) onUpdate;
  final Function(String id) onDelete;

  void _openCommentForm(BuildContext context, Moment moment) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CommentPage(momentId: moment.id,))
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: largeSize,
          vertical: mediumSize,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(extraLargeSize),
          image: DecorationImage(
            // image: AssetImage('assets/images/moments_background_dark.png'),
            image: NetworkImage(moment.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PostTitle(
              moment: moment,
              onUpdate: onUpdate,
              onDelete: onDelete,
            ),
            Padding(
              padding: const EdgeInsets.all(smallSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PostAction(
                        icon: 'assets/icons/fi-br-heart.svg',
                        label: moment.likeCount.toString(),
                      ),
                      PostAction(
                        icon: 'assets/icons/fi-br-comment.svg',
                        label: moment.commentCount.toString(),
                        action: () => _openCommentForm(context, moment),
                      ),
                      PostAction(
                        icon: 'assets/icons/fi-br-bookmark.svg',
                        label: moment.bookmarkCount.toString(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: largeSize, bottom: mediumSize),
                    child: Text(
                      moment.caption,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}