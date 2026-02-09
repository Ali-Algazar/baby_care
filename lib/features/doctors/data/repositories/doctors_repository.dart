import 'package:baby_care/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorsRepository {
  Future<Either<Failure, List>> getAllDoctors();

  Future<Either<Failure, List>> getNearbyDoctors(
    String latitude,
    String longitude,
  );
}
