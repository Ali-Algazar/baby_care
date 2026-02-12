import 'package:hive_flutter/hive_flutter.dart';

part 'post_model.g.dart';

@HiveType(typeId: 11)
class PostModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String authorName;
  @HiveField(4)
  final int views;
  @HiveField(5)
  final int commentCount;
  @HiveField(6)
  final List<String> likes;
  @HiveField(7)
  final List<String> saves;
  @HiveField(8)
  final bool isLiked;
  @HiveField(9)
  final bool isSaved;
  @HiveField(10)
  final bool isDisliked;
  @HiveField(11)
  final DateTime createdAt;
  @HiveField(12)
  final DateTime updatedAt;
  @HiveField(13)
  final String? imageUrl;
  @HiveField(14)
  final List<String> dislikes;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.authorName,
    required this.views,
    required this.commentCount,
    required this.likes,
    required this.saves,
    required this.isLiked,
    required this.isSaved,
    required this.isDisliked,
    required this.createdAt,
    required this.updatedAt,
    this.imageUrl,
    required this.dislikes,
  });

  int get likesCount => likes.length;
  int get dislikesCount => dislikes.length;
  int get savesCount => saves.length;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      authorName: json['author']['name'],
      views: json['views'],
      commentCount: json['commentCount'],
      likes: List<String>.from(json['likes'] ?? []),
      saves: List<String>.from(json['saves'] ?? []),
      dislikes: List<String>.from(json['dislikes'] ?? []),
      isLiked: json['isLiked'] ?? false,
      isSaved: json['isSaved'] ?? false,
      isDisliked: json['isDisliked'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'content': content,
      'authorName': authorName,
      'views': views,
      'commentCount': commentCount,
      'likes': likes,
      'saves': saves,
      'dislikes': dislikes,
      'isLiked': isLiked,
      'isSaved': isSaved,
      'isDisliked': isDisliked,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  PostModel copyWith({
    List<String>? likes,
    List<String>? saves,
    List<String>? dislikes,
    bool? isLiked,
    bool? isSaved,
    bool? isDisliked,
  }) {
    return PostModel(
      id: id,
      title: title,
      content: content,
      authorName: authorName,
      views: views,
      commentCount: commentCount,
      likes: likes ?? this.likes,
      saves: saves ?? this.saves,
      dislikes: dislikes ?? this.dislikes,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
      isDisliked: isDisliked ?? this.isDisliked,
      createdAt: createdAt,
      updatedAt: updatedAt,
      imageUrl: imageUrl,
    );
  }
}
