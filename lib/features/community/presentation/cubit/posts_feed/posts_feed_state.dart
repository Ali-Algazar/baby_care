import 'package:baby_care/features/community/data/model/post_model.dart';

abstract class PostsFeedState {}

class PostsFeedInitial extends PostsFeedState {}

class PostsFeedLoading extends PostsFeedState {}

class PostsFeedLoaded extends PostsFeedState {
  final List<PostModel> posts;
  PostsFeedLoaded(this.posts);
}

class PostsFeedError extends PostsFeedState {
  final String message;
  PostsFeedError(this.message);
}
