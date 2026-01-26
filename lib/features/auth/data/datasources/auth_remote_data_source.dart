import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class AuthRemoteDataSource {
  Future<Response> login({required String email, required String password});
  Future<Response> register({
    required String email,
    required String password,
    required String nationalId,
    required String displayName,
  });
  Future<Response> updateFcmToken();
  Future<Response> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiHelper apiHelper;
  AuthRemoteDataSourceImpl(this.apiHelper);
  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    var response = await apiHelper.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );

    return response;
  }

  @override
  Future<Response> register({
    required String email,
    required String password,
    required String nationalId,
    required String displayName,
  }) async {
    var response = await apiHelper.post(
      ApiEndpoints.register,
      data: {
        "name": displayName,
        "email": email,
        "password": password,
        "nationalId": nationalId,
      },
    );

    return response;
  }

  @override
  Future<Response<dynamic>> updateFcmToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    return apiHelper.put(
      ApiEndpoints.updateFcmToken,
      data: {'fcmToken': token},
      requiresAuth: true,
    );
  }

  @override
  Future<Response<dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    var response = await apiHelper.put(
      ApiEndpoints.changePassword,
      data: {"currentPassword": currentPassword, "newPassword": newPassword},
      requiresAuth: true,
    );

    return response;
  }
}
