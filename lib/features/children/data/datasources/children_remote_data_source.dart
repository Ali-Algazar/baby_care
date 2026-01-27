import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class ChildrenRemoteDataSource {
  Future<Response> getChildren();
}

class ChildrenRemoteDataSourceImpl implements ChildrenRemoteDataSource {
  final ApiHelper apiHelper;
  ChildrenRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<Response> getChildren() async {
    var response = await apiHelper.get(
      ApiEndpoints.myChildren,
      requiresAuth: true,
    );

    return response;
  }
}
