import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:baby_care/features/blog/presentation/view/widgets/articles_view_body.dart';
import 'package:flutter/material.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});
  static const String routeName = '/articles';

  @override
  Widget build(BuildContext context) {
    final articleModel =
        ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return Scaffold(body: ArticlesViewBody(articleModel: articleModel));
  }
}
