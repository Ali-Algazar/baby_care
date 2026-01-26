import 'package:baby_care/features/auth/data/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._authRepository) : super(ChangePasswordInitial());

  final AuthRepository _authRepository;

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result = await _authRepository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.message)),
      (_) => emit(ChangePasswordSuccess()),
    );
  }
}
