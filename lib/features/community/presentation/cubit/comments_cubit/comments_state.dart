part of 'comments_cubit.dart';

abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<CommentModel> comments;
  CommentsLoaded(this.comments);
}
