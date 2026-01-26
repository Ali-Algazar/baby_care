import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/auth/data/model/user_model.dart';

import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, UserModel>> register(
    String email,
    String password,
    String nationalId,
    String displayName,
  );
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, UserModel>> checkAuth();
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
