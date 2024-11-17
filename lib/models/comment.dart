class Comment {
  String id;
  String momentId;
  String creator;
  String comment;
  DateTime createdAt;

  Comment({
    required this.id,
    required this.momentId,
    required this.creator,
    required this.comment,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}