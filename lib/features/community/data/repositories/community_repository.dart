import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/community/data/model/post_details_model.dart';
import 'package:baby_care/features/community/data/model/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class CommunityRepository {
  Future<Either<Failure, List<PostModel>>> getPosts();
  Future<Either<Failure, PostModel>> addPost(
    String title,
    String content,
    String? imagePath,
  );
  Future<Either<Failure, List<PostModel>>> searchInPosts(String query);
  Future<Either<Failure, PostDetailsModel>> getPostById(String postId);
  Future<Either<Failure, void>> deletePost(String postId);
  Future<Either<Failure, void>> likePost(String postId);
  Future<Either<Failure, void>> unlikePost(String postId);
  Future<Either<Failure, void>> savePost(String postId);
  Future<Either<Failure, void>> unsavePost(String postId);
  Future<Either<Failure, List<PostModel>>> getSavedPosts();
  Future<Either<Failure, List<PostModel>>> getMyPosts();
  Future<Either<Failure, void>> addComment(String comment, String postId);
  Future<Either<Failure, void>> deleteComment(String commentId);
  Future<Either<Failure, void>> likeComment(String commentId);
  Future<Either<Failure, void>> unlikeComment(String commentId);
}
