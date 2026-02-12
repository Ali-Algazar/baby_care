part of 'add_post_cubit.dart';

abstract class AddPostState {}

class AddPostInitial extends AddPostState {}

class AddPostLoading extends AddPostState {}

class AddPostSuccess extends AddPostState {
  final PostModel post;
  AddPostSuccess(this.post);
}

class AddPostError extends AddPostState {
  final String message;
  AddPostError(this.message);
}
