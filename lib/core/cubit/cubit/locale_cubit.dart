import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<String> {
  LocaleCubit() : super('ar');

  void changeLocale(String locale) {
    emit(locale);
  }
}
