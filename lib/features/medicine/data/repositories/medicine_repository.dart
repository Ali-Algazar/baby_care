import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/medicine/data/model/medicine_model.dart';
import 'package:dartz/dartz.dart';

abstract class MedicineRepository {
  Future<Either<Failure, List<MedicineModel>>> getAllMedicines();
}
