part of 'post_details_cubit.dart';

abstract class PostDetailsState {}

class PostDetailsInitial extends PostDetailsState {}

class PostDetailsLoading extends PostDetailsState {}

class PostDetailsLoaded extends PostDetailsState {
  final PostDetailsModel postDetails;

  PostDetailsLoaded(this.postDetails);
}

class PostDetailsError extends PostDetailsState {
  final String message;
  PostDetailsError(this.message);
}
