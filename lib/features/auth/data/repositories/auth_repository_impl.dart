import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:baby_care/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:baby_care/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      var response = await remoteDataSource.login(
        email: email,
        password: password,
      );

      if (response.statusCode == 400) {
        return Left(ServerFailure(response.data['message']));
      }
      if (response.statusCode == 401) {
        return Left(ServerFailure('INVALID_CREDENTIALS'));
      }
      var user = UserModel.fromJson(response.data);
      await localDataSource.cacheUserToken(response.data['token']);
      await localDataSource.cacheUser(user);

      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await localDataSource.clearCachedUser();
      await localDataSource.clearCachedUserToken();
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
    String email,
    String password,
    String nationalId, {
    String? displayName,
  }) async {
    try {
      var response = await remoteDataSource.register(
        email: email,
        password: password,
        nationalId: nationalId,
      );

      if (response.statusCode == 400) {
        return Left(ServerFailure(response.data['message']));
      }
      var user = UserModel.fromJson(response.data);
      await localDataSource.cacheUserToken(response.data['token']);
      await localDataSource.cacheUser(user);

      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> checkAuth() async {
    try {
      final token = await localDataSource.getCachedUserToken();
      if (token == null) {
        return Left(ServerFailure('No cached token found'));
      }
      final user = await localDataSource.getCachedUser();
      return Right(user!);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
