import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class DoctorsRemoteDataSource {
  Future<Response> getAllDoctors();

  Future<Response> getNearbyDoctors(String latitude, String longitude);
}

class DoctorsRemoteDataSourceImpl implements DoctorsRemoteDataSource {
  final ApiHelper apiHelper;
  DoctorsRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<Response<dynamic>> getAllDoctors() async {
    final response = await apiHelper.get(
      ApiEndpoints.doctors,
      requiresAuth: true,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> getNearbyDoctors(
    String latitude,
    String longitude,
  ) async {
    final response = await apiHelper.get(
      '${ApiEndpoints.nearbyDoctors}?lat=$latitude&lng=$longitude',
      requiresAuth: true,
    );
    return response;
  }
}
