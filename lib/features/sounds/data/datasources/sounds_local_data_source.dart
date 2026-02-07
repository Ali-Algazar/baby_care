import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/sounds/data/model/sound_model.dart';

abstract class SoundsLocalDataSource {
  Future<void> cacheSounds(List<SoundModel> sounds);
  Future<List> getCachedSounds();
}

class SoundsLocalDataSourceImpl implements SoundsLocalDataSource {
  @override
  Future<void> cacheSounds(List<SoundModel> sounds) async {
    for (var sound in sounds) {
      HiveHelper.putData(
        boxName: Constants.kSoundsBox,
        key: sound.id,
        value: sound,
      );
    }
  }

  @override
  Future<List> getCachedSounds() async {
    final box = HiveHelper.getAllValues(Constants.kSoundsBox);
    return box;
  }
}
