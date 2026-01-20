import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:baby_care/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:baby_care/features/auth/data/repositories/auth_repository.dart';
import 'package:baby_care/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    ),
  );
  sl.registerLazySingleton<ApiHelper>(() => ApiHelper(sl<Dio>()));

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<ApiHelper>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl<AuthLocalDataSource>(),
      remoteDataSource: sl<AuthRemoteDataSource>(),
    ),
  );
}
