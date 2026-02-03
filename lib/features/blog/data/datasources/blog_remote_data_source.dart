import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class BlogRemoteDataSource {
  Future<Response> fetchBlogArticles();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final ApiHelper apiHelper;

  BlogRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<Response> fetchBlogArticles() async {
    final response = await apiHelper.get(
      ApiEndpoints.articles,
      requiresAuth: true,
    );
    return response;
  }
}
