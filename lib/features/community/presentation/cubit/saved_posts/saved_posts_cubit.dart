import 'package:baby_care/features/community/data/model/post_model.dart';
import 'package:baby_care/features/community/data/repositories/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'saved_posts_state.dart';

class SavedPostsCubit extends Cubit<SavedPostsState> {
  final CommunityRepository repository;
  final Box<PostModel> _box = Hive.box<PostModel>('savedPostsBox');

  SavedPostsCubit({required this.repository}) : super(SavedPostsInitial());

  Future<void> loadSavedPosts() async {
    emit(SavedPostsLoading());

    try {
      final cached = _box.values.toList();
      if (cached.isNotEmpty) {
        emit(SavedPostsLoaded(cached));
      }

      final result = await repository.getSavedPosts();
      result.fold((failure) => emit(SavedPostsError(failure.toString())), (
        posts,
      ) {
        emit(SavedPostsLoaded(posts));
      });
    } catch (e) {
      emit(SavedPostsError(e.toString()));
    }
  }

  void updatePost(PostModel updatedPost) {
    if (state is SavedPostsLoaded) {
      final currentPosts = (state as SavedPostsLoaded).posts;
      final index = currentPosts.indexWhere((p) => p.id == updatedPost.id);

      if (index != -1) {
        currentPosts[index] = updatedPost;
        _box.put(updatedPost.id, updatedPost);
        emit(SavedPostsLoaded(List.from(currentPosts)));
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
