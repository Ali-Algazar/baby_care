import 'package:baby_care/features/community/data/model/post_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final Box<CommentModel> _box = Hive.box<CommentModel>('commentsBox');

  CommentsCubit() : super(CommentsInitial());

  void setComments(List<CommentModel> comments) {
    for (var comment in comments) {
      _box.put(comment.id, comment);
    }
    emit(CommentsLoaded(comments));
  }

  void addComment(CommentModel comment) {
    _box.put(comment.id, comment);
    if (state is CommentsLoaded) {
      final current = (state as CommentsLoaded).comments;
      emit(CommentsLoaded([comment, ...current]));
    } else {
      emit(CommentsLoaded([comment]));
    }
  }

  void deleteComment(String commentId) {
    _box.delete(commentId);
    if (state is CommentsLoaded) {
      final current = (state as CommentsLoaded).comments
          .where((c) => c.id != commentId)
          .toList();
      emit(CommentsLoaded(current));
    }
  }

  void toggleLike(CommentModel comment, String currentUserId) {
    final updatedLikes = List<String>.from(comment.likes);
    if (updatedLikes.contains(currentUserId)) {
      updatedLikes.remove(currentUserId);
    } else {
      updatedLikes.add(currentUserId);
    }

    final updatedComment = comment.copyWith(likes: updatedLikes);
    _updateComment(updatedComment);
  }

  void toggleDislike(CommentModel comment, String currentUserId) {
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
    _box.put(updatedComment.id, updatedComment);
    if (state is CommentsLoaded) {
      final current = (state as CommentsLoaded).comments
          .map((c) => c.id == updatedComment.id ? updatedComment : c)
          .toList();
      emit(CommentsLoaded(current));
    }
  }
}
