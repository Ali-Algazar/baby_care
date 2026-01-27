import 'package:baby_care/features/children/data/repositories/children_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit({required this.repository}) : super(ChildrenInitial());
  ChildrenRepository repository;

  Future<void> getChildren() async {
    emit(ChildrenLoading());
    var result = await repository.getChildren();
    result.fold((l) => emit(ChildrenError(message: l.message)), (r) {
      if (r.isEmpty) {
        emit(ChildrenEmpty());
      }
      emit(ChildrenLoaded(children: r));
    });
  }
}
