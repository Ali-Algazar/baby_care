import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/blog/data/model/article_model.dart';

abstract class BlogLocalDataSource {
  Future<void> cacheBlogArticles(List<ArticleModel> articles);
  Future<List> getCachedBlogArticles();
}

class BlogLocalDataSourceImpl implements BlogLocalDataSource {
  @override
  Future<void> cacheBlogArticles(List<ArticleModel> articles) async {
    for (var article in articles) {
      await HiveHelper.putData(
        boxName: Constants.kArticlesBox,
        key: article.id,
        value: article,
      );
    }
  }

  @override
  Future<List> getCachedBlogArticles() async {
    final boxData = await HiveHelper.getAllValues(Constants.kArticlesBox);
    return boxData;
  }
}
