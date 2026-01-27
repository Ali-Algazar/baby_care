import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/children/data/model/child_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChildrenRepository {
  Future<Either<Failure, List<ChildModel>>> getChildren();
}
