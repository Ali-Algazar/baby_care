abstract class BlogState {}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List articles;

  BlogLoaded(this.articles);
}

class BlogError extends BlogState {
  final String message;

  BlogError(this.message);
}

final class BlogEmpty extends BlogState {}
