import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/sounds/data/model/sound_model.dart';
import 'package:dartz/dartz.dart';

abstract class SoundsRepository {
  Future<Either<Failure, List<SoundModel>>> fetchSounds();
}
