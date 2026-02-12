import 'package:baby_care/features/community/data/model/post_model.dart';
import 'package:baby_care/features/community/data/repositories/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'my_posts_state.dart';

class MyPostsCubit extends Cubit<MyPostsState> {
  final CommunityRepository repository;
  final Box<PostModel> _box = Hive.box<PostModel>('myPostsBox');

  MyPostsCubit({required this.repository}) : super(MyPostsInitial());

  Future<void> loadMyPosts() async {
    emit(MyPostsLoading());

    try {
      final cached = _box.values.toList();
      if (cached.isNotEmpty) {
        emit(MyPostsLoaded(cached));
      }

      final result = await repository.getMyPosts();
      result.fold((failure) => emit(MyPostsError(failure.toString())), (posts) {
        emit(MyPostsLoaded(posts));
      });
    } catch (e) {
      emit(MyPostsError(e.toString()));
    }
  }

  void updatePost(PostModel updatedPost) {
    if (state is MyPostsLoaded) {
      final currentPosts = (state as MyPostsLoaded).posts;
      final index = currentPosts.indexWhere((p) => p.id == updatedPost.id);
      if (index != -1) {
        emit(MyPostsLoaded(List.from(currentPosts)));
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
      likes: updatedLikes,
      isLiked: !post.isLiked,
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
      dislikes: updatedDislikes,
      isDisliked: !post.isDisliked,
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

    final updated = post.copyWith(saves: updatedSaves, isSaved: !post.isSaved);

    updatePost(updated);
  }
}
