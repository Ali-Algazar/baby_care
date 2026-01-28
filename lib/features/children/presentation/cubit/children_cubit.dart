import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/shared_preferences_service.dart';
import 'package:baby_care/features/children/data/repositories/children_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit({required this.repository}) : super(ChildrenInitial());
  ChildrenRepository repository;

  Future<void> getChildren() async {
    emit(ChildrenLoading());
    var result = await repository.getChildren();
    String? childId = await SharedPreferencesService.getData(
      key: Constants.currentChildId,
    );
    result.fold(
      (l) async {
        emit(ChildrenError(message: l.message));
      },
      (r) {
        if (r.isEmpty) {
          emit(ChildrenEmpty());
        } else {
          if (childId == null) {
            childId = r.first.id;
            SharedPreferencesService.saveData(
              key: Constants.currentChildId,
              value: childId,
            );
          }
          emit(ChildrenLoaded(children: r));
        }
      },
    );
  }
}
