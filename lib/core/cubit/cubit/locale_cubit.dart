import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<String> {
  LocaleCubit() : super('ar');

  void changeLocale() {
    if (state == 'ar') {
      emit('en');
    } else {
      emit('ar');
    }
  }
}
