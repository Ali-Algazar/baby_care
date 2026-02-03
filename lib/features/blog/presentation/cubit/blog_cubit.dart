import 'package:baby_care/features/blog/data/repositories/blog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit(this.blogRepository) : super(BlogInitial());
  final BlogRepository blogRepository;

  Future<void> fetchBlogArticles() async {
    emit(BlogLoading());
    final result = await blogRepository.fetchBlogArticles();
    result.fold((failure) => emit(BlogError(failure.message)), (articles) {
      if (articles.isEmpty) {
        emit(BlogEmpty());
      } else {
        emit(BlogLoaded(articles));
      }
    });
  }
}
