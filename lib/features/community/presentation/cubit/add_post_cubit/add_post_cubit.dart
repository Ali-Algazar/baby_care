import 'package:baby_care/features/community/data/model/post_model.dart';
import 'package:baby_care/features/community/data/repositories/community_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final CommunityRepository repository;

  AddPostCubit({required this.repository}) : super(AddPostInitial());

  Future<void> addPost({
    required String title,
    required String content,
    String? imagePath,
  }) async {
    emit(AddPostLoading());

    final result = await repository.addPost(title, content, imagePath);

    result.fold(
      (failure) => emit(AddPostError(failure.toString())),
      (post) => emit(AddPostSuccess(post)),
    );
  }
}
