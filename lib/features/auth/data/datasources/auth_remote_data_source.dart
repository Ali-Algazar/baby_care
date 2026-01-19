import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:baby_care/features/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({
    required String email,
    required String password,
    required String nationalId,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiHelper apiHelper;
  AuthRemoteDataSourceImpl(this.apiHelper);
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var response = await apiHelper.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );

    return UserModel.fromJson(response.data);
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String nationalId,
  }) async {
    var response = await apiHelper.post(
      ApiEndpoints.register,
      data: {'email': email, 'password': password, 'nationalId': nationalId},
    );

    return UserModel.fromJson(response.data);
  }
}
