import 'package:baby_care/features/community/data/model/post_details_model.dart';
import 'package:baby_care/features/community/data/model/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit() : super(PostDetailsInitial());

  final _box = Hive.box<PostDetailsModel>('postDetailsBox');

  Future<void> loadPostDetails(String postId) async {
    emit(PostDetailsLoading());

    final cached = _box.get(postId);
    if (cached != null) {
      emit(PostDetailsLoaded(cached));
      return;
    }
    emit(PostDetailsError('Post not found locally'));
  }

  void updatePost(PostModel updatedPost) {
    if (state is PostDetailsLoaded) {
      final current = (state as PostDetailsLoaded).postDetails;
      final updated = current.copyWithPost(updatedPost);
      _box.put(updatedPost.id, updated);
      emit(PostDetailsLoaded(updated));
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

  void addComment(CommentModel comment) {
    if (state is PostDetailsLoaded) {
      final current = (state as PostDetailsLoaded).postDetails;
      final updatedComments = List<CommentModel>.from(current.comments)
        ..insert(0, comment);
      final newDetails = PostDetailsModel(
        post: current.post,
        comments: updatedComments,
      );
      _box.put(current.post.id, newDetails);
      emit(PostDetailsLoaded(newDetails));
    }
  }

  void deleteComment(String commentId) {
    if (state is PostDetailsLoaded) {
      final current = (state as PostDetailsLoaded).postDetails;
      final updatedComments = current.comments
          .where((c) => c.id != commentId)
          .toList();
      final newDetails = PostDetailsModel(
        post: current.post,
        comments: updatedComments,
      );
      _box.put(current.post.id, newDetails);
      emit(PostDetailsLoaded(newDetails));
    }
  }

  void toggleLikeComment(CommentModel comment, String currentUserId) {
    final updatedLikes = List<String>.from(comment.likes);
    if (updatedLikes.contains(currentUserId)) {
      updatedLikes.remove(currentUserId);
    } else {
      updatedLikes.add(currentUserId);
    }

    final updatedComment = comment.copyWith(likes: updatedLikes);
    _updateComment(updatedComment);
  }

  void toggleDislikeComment(CommentModel comment, String currentUserId) {
    final updatedDislikes = List<String>.from(comment.dislikes);
    if (updatedDislikes.contains(currentUserId)) {
      updatedDislikes.remove(currentUserId);
    } else {
      updatedDislikes.add(currentUserId);
    }

    final updatedComment = comment.copyWith(dislikes: updatedDislikes);
    _updateComment(updatedComment);
  }

  void _updateComment(CommentModel updatedComment) {
    if (state is PostDetailsLoaded) {
      final current = (state as PostDetailsLoaded).postDetails;
      final updatedComments = current.comments.map((c) {
        return c.id == updatedComment.id ? updatedComment : c;
      }).toList();

      final newDetails = PostDetailsModel(
        post: current.post,
        comments: updatedComments,
      );
      _box.put(current.post.id, newDetails);
      emit(PostDetailsLoaded(newDetails));
    }
  }
}
