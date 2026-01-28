import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:dartz/dartz.dart';

abstract class VaccinationRepository {
  Future<Either<Failure, List<List<VaccineRecordModel>>>> getVaccination(
    String id,
  );

  Future<Either<Failure, List<VaccineRecordModel>>> getVaccinationHome(
    String id,
  );
}
