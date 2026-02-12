import 'dart:io';

import 'package:baby_care/core/errors/failures.dart';

import 'package:baby_care/features/community/data/model/post_details_model.dart';

import 'package:baby_care/features/community/data/model/post_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'community_repository.dart';

import '../datasources/community_remote_data_source.dart';
import '../datasources/community_local_data_source.dart';

class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityRemoteDataSource remoteDataSource;
  final CommunityLocalDataSource localDataSource;
  final Connectivity connectivity;

  CommunityRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, void>> addComment(
    String comment,
    String postId,
  ) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.addComment(comment, postId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PostModel>> addPost(
    String title,
    String content,
    String? imagePath,
  ) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.addPost(
          title,
          content,
          imagePath,
        );
        if (response.statusCode == 200) {
          final post = PostModel.fromJson(response.data);
          return right(post);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment(String commentId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.deleteComment(commentId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePost(String postId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.deletePost(postId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getMyPosts() async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.getMyPosts();
        if (response.statusCode == 200) {
          final posts = (response.data['data'] as List)
              .map((postJson) => PostModel.fromJson(postJson))
              .toList();
          localDataSource.cacheMyPosts(posts);
          return right(posts);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        final cachedPosts = await localDataSource.getMyPosts();
        if (cachedPosts.isNotEmpty) {
          return right(cachedPosts as List<PostModel>);
        } else {
          return left(NetworkFailure('No internet connection'));
        }
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PostDetailsModel>> getPostById(String postId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.getPostById(postId);
        if (response.statusCode == 200) {
          final postDetails = PostDetailsModel.fromJson(response.data);
          return right(postDetails);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.getPosts();
        if (response.statusCode == 200) {
          final posts = (response.data['data'] as List)
              .map((postJson) => PostModel.fromJson(postJson))
              .toList();
          localDataSource.cacheAllPosts(posts);
          return right(posts);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        final cachedPosts = await localDataSource.getAllPosts();
        if (cachedPosts.isNotEmpty) {
          return right(cachedPosts as List<PostModel>);
        } else {
          return left(NetworkFailure('No internet connection'));
        }
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getSavedPosts() async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.getSavedPosts();
        if (response.statusCode == 200) {
          final posts = (response.data['data'] as List)
              .map((postJson) => PostModel.fromJson(postJson))
              .toList();
          localDataSource.cacheMySavedPosts(posts);
          return right(posts);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        final cachedPosts = await localDataSource.getMySavedPosts();
        if (cachedPosts.isNotEmpty) {
          return right(cachedPosts as List<PostModel>);
        } else {
          return left(NetworkFailure('No internet connection'));
        }
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> likeComment(String commentId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.likeComment(commentId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> likePost(String postId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.likePost(postId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> savePost(String postId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.savePost(postId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> searchInPosts(String query) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.searchInPosts(query);
        if (response.statusCode == 200) {
          final posts = (response.data['data'] as List)
              .map((postJson) => PostModel.fromJson(postJson))
              .toList();
          return right(posts);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unlikeComment(String commentId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.unlikeComment(commentId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unlikePost(String postId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.unlikePost(postId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unsavePost(String postId) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.unsavePost(postId);
        if (response.statusCode == 200) {
          return right(null);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<bool> hasConnection() async {
    final results = await connectivity.checkConnectivity();
    final hasConnection =
        results.isNotEmpty && results.first != ConnectivityResult.none;

    return hasConnection;
  }
}
