import 'package:baby_care/features/community/data/model/post_model.dart';
import 'package:baby_care/features/community/presentation/cubit/posts_feed/posts_feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PostsFeedCubit extends Cubit<PostsFeedState> {
  PostsFeedCubit() : super(PostsFeedInitial());

  final _box = Hive.box<PostModel>('postsBox');

  Future<void> loadPosts() async {
    emit(PostsFeedLoading());
    final posts = _box.values.toList();
    emit(PostsFeedLoaded(posts));
  }

  void updatePost(PostModel updatedPost) {
    if (state is PostsFeedLoaded) {
      final currentPosts = (state as PostsFeedLoaded).posts;
      final index = currentPosts.indexWhere((e) => e.id == updatedPost.id);
      if (index != -1) {
        currentPosts[index] = updatedPost;
        _box.put(updatedPost.id, updatedPost);
        emit(PostsFeedLoaded(List.from(currentPosts)));
      }
    }
  }

  void toggleLike(PostModel post, String currentUserId) {
    final updatedLikes = List<String>.from(post.likes);
    if (post.isLiked) {
      updatedLikes.remove(currentUserId);
    } else {
      updatedLikes.add(currentUserId);
    }

    final updated = post.copyWith(
      isLiked: !post.isLiked,
      likes: updatedLikes,
      isDisliked: false,
    );

    updatePost(updated);
  }

  void toggleDislike(PostModel post, String currentUserId) {
    final updatedDislikes = List<String>.from(post.dislikes);
    if (post.isDisliked) {
      updatedDislikes.remove(currentUserId);
    } else {
      updatedDislikes.add(currentUserId);
    }

    final updated = post.copyWith(
      isDisliked: !post.isDisliked,
      dislikes: updatedDislikes,
      isLiked: false,
    );

    updatePost(updated);
  }

  void toggleSave(PostModel post, String currentUserId) {
    final updatedSaves = List<String>.from(post.saves);
    if (post.isSaved) {
      updatedSaves.remove(currentUserId);
    } else {
      updatedSaves.add(currentUserId);
    }

    final updated = post.copyWith(isSaved: !post.isSaved, saves: updatedSaves);

    updatePost(updated);
  }
}
