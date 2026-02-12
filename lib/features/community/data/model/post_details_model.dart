import 'package:baby_care/features/community/data/model/post_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'post_details_model.g.dart';

@HiveType(typeId: 12)
class PostDetailsModel {
  @HiveField(0)
  final PostModel post;
  @HiveField(1)
  final List<CommentModel> comments;

  PostDetailsModel({required this.post, required this.comments});

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
      post: PostModel.fromJson(json['post']),
      comments: List<CommentModel>.from(
        (json['comments'] ?? []).map((e) => CommentModel.fromJson(e)),
      ),
    );
  }
}

@HiveType(typeId: 13)
class CommentModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String authorName;
  @HiveField(3)
  final String postId;
  @HiveField(4)
  final List<String> likes;
  @HiveField(5)
  final List<String> dislikes;
  @HiveField(6)
  final DateTime createdAt;
  @HiveField(7)
  final DateTime updatedAt;

  CommentModel({
    required this.id,
    required this.content,
    required this.authorName,
    required this.postId,
    required this.likes,
    required this.dislikes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['_id'],
      content: json['content'],
      authorName: json['author']['name'],
      postId: json['post'],
      likes: List<String>.from(json['likes'] ?? []),
      dislikes: List<String>.from(json['dislikes'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
