import 'package:baby_care/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DoctorsRepository {
  Future<Either<Failure, List>> getAllDoctors(CancelToken cancelToken);

  Future<Either<Failure, List>> getNearbyDoctors(
    String latitude,
    String longitude, {
    required CancelToken cancelToken,
  });
}
