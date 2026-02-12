import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/community/data/model/post_model.dart';

abstract class CommunityLocalDataSource {
  Future<void> cacheAllPosts(List<PostModel> posts);
  Future<List> getAllPosts();
  Future<void> cacheMyPosts(List<PostModel> myPosts);
  Future<List> getMyPosts();
  Future<void> cacheMySavedPosts(List<PostModel> mySavedPosts);
  Future<List> getMySavedPosts();
}

class CommunityLocalDataSourceImpl implements CommunityLocalDataSource {
  @override
  Future<void> cacheAllPosts(List<PostModel> posts) async {
    for (var post in posts) {
      await HiveHelper.putData(
        boxName: Constants.kPostsBox,
        key: post.id.toString(),
        value: post,
      );
    }
  }

  @override
  Future<void> cacheMyPosts(List<PostModel> myPosts) async {
    for (var post in myPosts) {
      await HiveHelper.putData(
        boxName: Constants.kMyPostsBox,
        key: post.id.toString(),
        value: post,
      );
    }
  }

  @override
  Future<void> cacheMySavedPosts(List<PostModel> mySavedPosts) async {
    for (var post in mySavedPosts) {
      await HiveHelper.putData(
        boxName: Constants.kMySavedPostsBox,
        key: post.id.toString(),
        value: post,
      );
    }
  }

  @override
  Future<List> getAllPosts() async {
    final box = await HiveHelper.getAllValues(Constants.kPostsBox);
    return box;
  }

  @override
  Future<List> getMyPosts() async {
    final box = await HiveHelper.getAllValues(Constants.kMyPostsBox);
    return box;
  }

  @override
  Future<List> getMySavedPosts() async {
    final box = await HiveHelper.getAllValues(Constants.kMySavedPostsBox);
    return box;
  }
}
