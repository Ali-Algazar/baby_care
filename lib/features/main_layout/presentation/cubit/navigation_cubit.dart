import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(1);

  void navigateToHmoe() {
    emit(state + 1);
  }
}
