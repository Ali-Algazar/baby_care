import 'package:baby_care/features/sounds/data/model/sound_model.dart';

abstract class SoundsState {}

class SoundsInitial extends SoundsState {}

class SoundsLoaded extends SoundsState {
  final List<SoundModel> sounds;

  SoundsLoaded(this.sounds);
}

class SoundsError extends SoundsState {
  final String message;

  SoundsError(this.message);
}

class SoundsLoading extends SoundsState {}

class SoundsEmpty extends SoundsState {}
