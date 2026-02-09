import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class DoctorsRemoteDataSource {
  Future<Response> getAllDoctors(CancelToken cancelToken);

  Future<Response> getNearbyDoctors(
    String latitude,
    String longitude,
    CancelToken cancelToken,
  );
}

class DoctorsRemoteDataSourceImpl implements DoctorsRemoteDataSource {
  final ApiHelper apiHelper;
  DoctorsRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<Response<dynamic>> getAllDoctors(CancelToken cancelToken) async {
    final response = await apiHelper.get(
      ApiEndpoints.doctors,
      requiresAuth: true,
      cancelToken: cancelToken,
    );
    return response;
  }

  @override
  Future<Response<dynamic>> getNearbyDoctors(
    String latitude,
    String longitude,
    CancelToken cancelToken,
  ) async {
    final response = await apiHelper.get(
      '${ApiEndpoints.nearbyDoctors}?lat=$latitude&lng=$longitude',
      requiresAuth: true,
      cancelToken: cancelToken,
    );
    return response;
  }
}
