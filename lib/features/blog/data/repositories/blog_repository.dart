import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:dartz/dartz.dart';

abstract class BlogRepository {
  Future<Either<Failure, List<ArticleModel>>> fetchBlogArticles();
  Future<Either<Failure, List<ArticleModel>>> fetchBlogArticlesHome();
}
