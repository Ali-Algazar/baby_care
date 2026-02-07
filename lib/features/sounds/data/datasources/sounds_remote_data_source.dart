import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class SoundsRemoteDataSource {
  Future<Response> fetchSounds();
}

class SoundsRemoteDataSourceImpl implements SoundsRemoteDataSource {
  final ApiHelper apiHelper;
  SoundsRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<Response> fetchSounds() async {
    final response = await apiHelper.get(
      ApiEndpoints.sounds,
      requiresAuth: true,
    );
    return response;
  }
}
