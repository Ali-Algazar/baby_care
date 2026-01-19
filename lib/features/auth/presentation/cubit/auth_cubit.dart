import 'package:baby_care/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  final AuthRepository authRepository;

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await authRepository.login(email, password);
    result.fold((failure) => emit(AuthError(failure.message)), (user) {
      emit(AuthSuccess(user: user));
    });
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await authRepository.logout();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(Unauthenticated()),
    );
  }

  Future<void> register(
    String email,
    String password,
    String nationalId,
  ) async {
    emit(AuthLoading());
    final result = await authRepository.register(email, password, nationalId);
    result.fold((failure) => emit(AuthError(failure.message)), (user) {
      emit(AuthSuccess(user: user));
    });
  }

  Future<void> checkAuth() async {
    emit(AuthLoading());
    final result = await authRepository.checkAuth();
    result.fold((failure) => emit(Unauthenticated()), (user) {
      emit(AuthSuccess(user: user));
    });
  }
}
