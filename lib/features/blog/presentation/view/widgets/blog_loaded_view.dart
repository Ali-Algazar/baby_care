import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:baby_care/features/home/presentation/view/widgets/articles_care_widget.dart';
import 'package:flutter/material.dart';

class BlogLoadedView extends StatelessWidget {
  const BlogLoadedView({super.key, required this.articles});
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: ArticlesCareWidget(articleModel: articles[index]),
      ),
    );
  }
}
