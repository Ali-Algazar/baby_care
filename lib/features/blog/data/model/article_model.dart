import 'package:hive/hive.dart';
part 'article_model.g.dart';

@HiveType(typeId: 7)
class ArticleModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String imageUrl;
  @HiveField(5)
  final String author;
  @HiveField(6)
  final DateTime createdAt;
  @HiveField(7)
  final DateTime updatedAt;
  @HiveField(8)
  final String description;

  ArticleModel({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.imageUrl,
    required this.author,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      author: json['author']['name'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      description: json['description'],
    );
  }
}
