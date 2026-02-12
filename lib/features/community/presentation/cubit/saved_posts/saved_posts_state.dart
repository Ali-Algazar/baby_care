part of 'saved_posts_cubit.dart';

abstract class SavedPostsState {}

class SavedPostsInitial extends SavedPostsState {}

class SavedPostsLoading extends SavedPostsState {}

class SavedPostsLoaded extends SavedPostsState {
  final List<PostModel> posts;
  SavedPostsLoaded(this.posts);
}

class SavedPostsError extends SavedPostsState {
  final String message;
  SavedPostsError(this.message);
}
