import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // sl = Service Locator

void setupServiceLocator() {
  // sl.registerSingleton<ApiHelper>(ApiHelper(Dio()));
  // sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
}
