import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/shared_preferences_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentChildCubit extends Cubit<String?> {
  CurrentChildCubit() : super(null) {
    getCurrentChild();
  }

  void setCurrentChild(String? childId) async {
    await SharedPreferencesService.saveData(
      key: Constants.currentChildId,
      value: childId,
    );
    emit(childId);
  }

  Future<void> getCurrentChild() async {
    String? childId = await SharedPreferencesService.getData(
      key: Constants.currentChildId,
    );
    emit(childId);
  }
}
