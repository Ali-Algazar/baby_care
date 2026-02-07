import 'package:baby_care/features/sounds/data/repositories/sounds_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sounds_state.dart';

class SoundsCubit extends Cubit<SoundsState> {
  SoundsCubit(this.soundsRepository) : super(SoundsInitial());
  final SoundsRepository soundsRepository;

  Future<void> fetchSounds() async {
    emit(SoundsLoading());
    final result = await soundsRepository.fetchSounds();
    result.fold((failure) => emit(SoundsError(failure.message)), (sounds) {
      if (sounds.isEmpty) {
        emit(SoundsEmpty());
      } else {
        emit(SoundsLoaded(sounds));
      }
    });
  }
}
