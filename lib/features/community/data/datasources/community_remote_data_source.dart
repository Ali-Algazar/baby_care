import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class CommunityRemoteDataSource {
  Future<Response> addPost(String title, String content, String? imagePath);
  Future<Response> getPosts();
  Future<Response> searchInPosts(String query);
  Future<Response> getPostById(String postId);
  Future<Response> deletePost(String postId);
  Future<Response> likePost(String postId);
  Future<Response> unlikePost(String postId);
  Future<Response> savePost(String postId);
  Future<Response> unsavePost(String postId);
  Future<Response> getSavedPosts();
  Future<Response> getMyPosts();
  Future<Response> addComment(String comment, String postId);
  Future<Response> deleteComment(String commentId);
  Future<Response> likeComment(String commentId);
  Future<Response> unlikeComment(String commentId);
}

class CommunityRemoteDataSourceImpl implements CommunityRemoteDataSource {
  final ApiHelper apiHelper;

  CommunityRemoteDataSourceImpl({required this.apiHelper});
  @override
  Future<Response<dynamic>> addComment(String comment, String postId) async {
    final response = await apiHelper.post(
      ApiEndpoints.postComments(postId),
      data: {"content": comment},
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> addPost(
    String title,
    String content,
    String? imagePath,
  ) async {
    final response = await apiHelper.post(
      ApiEndpoints.posts,
      data: {
        "title": title,
        "content": content,
        if (imagePath != null) "imageUrl": imagePath,
      },
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> deleteComment(String commentId) async {
    final response = await apiHelper.delete(
      ApiEndpoints.deleteComment(commentId),
    );
    return response;
  }

  @override
  Future<Response<dynamic>> deletePost(String postId) async {
    final response = await apiHelper.delete(
      ApiEndpoints.post(postId),
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> getMyPosts() async {
    final response = await apiHelper.get(
      '${ApiEndpoints.posts}?filter=my_posts',
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> getPostById(String postId) async {
    final response = await apiHelper.get(
      ApiEndpoints.post(postId),
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> getPosts() async {
    final response = await apiHelper.get(
      ApiEndpoints.posts,
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> getSavedPosts() async {
    final response = await apiHelper.get(
      '${ApiEndpoints.posts}?filter=saved',
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> likeComment(String commentId) async {
    final response = await apiHelper.post(
      ApiEndpoints.actionComment(commentId),
      requiresAuth: true,
      data: {"action": "like"},
    );
    return response;
  }

  @override
  Future<Response<dynamic>> likePost(String postId) async {
    final response = await apiHelper.post(
      ApiEndpoints.toggleAction(postId),
      requiresAuth: true,
      data: {"action": "like"},
    );
    return response;
  }

  @override
  Future<Response<dynamic>> savePost(String postId) async {
    final response = await apiHelper.post(
      ApiEndpoints.savePost(postId),
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> unlikeComment(String commentId) async {
    final response = await apiHelper.post(
      ApiEndpoints.actionComment(commentId),
      requiresAuth: true,
      data: {"action": "unlike"},
    );
    return response;
  }

  @override
  Future<Response<dynamic>> unlikePost(String postId) async {
    final response = await apiHelper.post(
      ApiEndpoints.toggleAction(postId),
      requiresAuth: true,
      data: {"action": "unlike"},
    );
    return response;
  }

  @override
  Future<Response<dynamic>> unsavePost(String postId) async {
    final response = await apiHelper.post(
      ApiEndpoints.savePost(postId),
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> searchInPosts(String query) async {
    final response = await apiHelper.get(
      '${ApiEndpoints.posts}?search=$query',
      requiresAuth: true,
    );
    return response;
  }
}
