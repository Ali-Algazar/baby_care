import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:baby_care/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:baby_care/features/auth/data/repositories/auth_repository.dart';
import 'package:baby_care/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:baby_care/features/blog/data/datasources/blog_local_data_source.dart';
import 'package:baby_care/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:baby_care/features/blog/data/repositories/blog_repository.dart';
import 'package:baby_care/features/blog/data/repositories/blog_repository_impl.dart';
import 'package:baby_care/features/chat_bot/data/datasources/chat_bot_local_data_source.dart';
import 'package:baby_care/features/chat_bot/data/datasources/chat_bot_remote_data_source.dart';
import 'package:baby_care/features/chat_bot/data/repositories/chat_bot_repository.dart';
import 'package:baby_care/features/chat_bot/data/repositories/chat_bot_repository_impl.dart';
import 'package:baby_care/features/children/data/datasources/children_local_data_source.dart';
import 'package:baby_care/features/children/data/datasources/children_remote_data_source.dart';
import 'package:baby_care/features/children/data/repositories/children_repository.dart';
import 'package:baby_care/features/children/data/repositories/children_repository_impl.dart';
import 'package:baby_care/features/sounds/data/datasources/sounds_local_data_source.dart';
import 'package:baby_care/features/sounds/data/datasources/sounds_remote_data_source.dart';
import 'package:baby_care/features/sounds/data/repositories/sounds_repository.dart';
import 'package:baby_care/features/sounds/data/repositories/sounds_repository_impl.dart';
import 'package:baby_care/features/vaccination/data/datasources/vaccination_local_data_source.dart';
import 'package:baby_care/features/vaccination/data/datasources/vaccination_remote_data_source.dart';
import 'package:baby_care/features/vaccination/data/repositories/vaccination_repository.dart';
import 'package:baby_care/features/vaccination/data/repositories/vaccination_repository_impl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  sl.registerLazySingleton<ChildrenLocalDataSource>(
    () => ChildrenLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<ChildrenRemoteDataSource>(
    () => ChildrenRemoteDataSourceImpl(apiHelper: sl<ApiHelper>()),
  );
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  sl.registerLazySingleton<ChildrenRepository>(
    () => ChildrenRepositoryImpl(
      localDataSource: sl<ChildrenLocalDataSource>(),
      remoteDataSource: sl<ChildrenRemoteDataSource>(),
      connectivity: sl<Connectivity>(),
    ),
  );
  sl.registerLazySingleton<VaccinationLocalDataSource>(
    () => VaccinationLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<VaccinationRemoteDataSource>(
    () => VaccinationRemoteDataSourceImpl(apiHelper: sl<ApiHelper>()),
  );

  sl.registerLazySingleton<VaccinationRepository>(
    () => VaccinationRepositoryImpl(
      localDataSource: sl<VaccinationLocalDataSource>(),
      remoteDataSource: sl<VaccinationRemoteDataSource>(),
      connectivity: sl<Connectivity>(),
    ),
  );

  sl.registerLazySingleton<ChatBotLocalDataSource>(
    () => ChatBotLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<ChatBotRemoteDataSource>(
    () => ChatBotRemoteDataSourceImpl(apiHelper: sl<ApiHelper>()),
  );

  sl.registerLazySingleton<ChatBotRepository>(
    () => ChatBotRepositoryImpl(
      localDataSource: sl<ChatBotLocalDataSource>(),
      remoteDataSource: sl<ChatBotRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<BlogLocalDataSource>(
    () => BlogLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<BlogRemoteDataSource>(
    () => BlogRemoteDataSourceImpl(apiHelper: sl<ApiHelper>()),
  );
  sl.registerLazySingleton<BlogRepository>(
    () => BlogRepositoryImpl(
      localDataSource: sl<BlogLocalDataSource>(),
      remoteDataSource: sl<BlogRemoteDataSource>(),
      connectivity: sl<Connectivity>(),
    ),
  );
  sl.registerLazySingleton<SoundsLocalDataSource>(
    () => SoundsLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<SoundsRemoteDataSource>(
    () => SoundsRemoteDataSourceImpl(apiHelper: sl<ApiHelper>()),
  );

  sl.registerLazySingleton<SoundsRepository>(
    () => SoundsRepositoryImpl(
      localDataSource: sl<SoundsLocalDataSource>(),
      remoteDataSource: sl<SoundsRemoteDataSource>(),
      connectivity: sl<Connectivity>(),
    ),
  );
}
