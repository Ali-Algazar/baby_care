import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class MedicineRemoteDataSource {
  Future<Response> getAllMedicines();
}

class MedicineRemoteDataSourceImpl implements MedicineRemoteDataSource {
  final ApiHelper apiHelper;
  MedicineRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<Response<dynamic>> getAllMedicines() async {
    final response = await apiHelper.get(
      ApiEndpoints.medicines,
      requiresAuth: true,
    );
    return response;
  }
}
