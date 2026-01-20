import 'package:dio/dio.dart';
import '../helper/shared_preferences_service.dart';

class ApiHelper {
  Dio dio;
  final String baseUrl = 'https://mom-hf4l.vercel.app/api/v1';

  ApiHelper(this.dio);

  Future<String?> _getAuthToken() async {
    return await SharedPreferencesService.getData(key: 'auth_token');
  }

  Future<Options?> _createAuthOptions(bool requiresAuth) async {
    if (requiresAuth) {
      String? token = await _getAuthToken();
      if (token != null) {
        return Options(headers: {'Authorization': 'Bearer $token'});
      }
    }
    return null;
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);

    return await dio.get(
      '$baseUrl$endpoint',
      queryParameters: data,
      options: options,
    );
  }

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);
    return await dio.post('$baseUrl$endpoint', data: data, options: options);
  }

  Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);
    return await dio.put('$baseUrl$endpoint', data: data, options: options);
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
  }) async {
    Options? options = await _createAuthOptions(requiresAuth);
    return await dio.delete('$baseUrl$endpoint', data: data, options: options);
  }
}
