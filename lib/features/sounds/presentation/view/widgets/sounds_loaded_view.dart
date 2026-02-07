import 'package:baby_care/features/sounds/data/model/sound_model.dart';
import 'package:baby_care/features/sounds/presentation/view/widgets/audio_player_card.dart';
import 'package:flutter/material.dart';

class SoundsLoadedView extends StatelessWidget {
  const SoundsLoadedView({super.key, required this.sounds});
  final List<SoundModel> sounds;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: sounds.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: AudioPlayerCard(soundModel: sounds[index]),
      ),
    );
  }
}
