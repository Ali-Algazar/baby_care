import 'package:baby_care/features/sounds/presentation/view/widgets/audio_player_shimmer.dart';
import 'package:flutter/material.dart';

class SoundsLoadingView extends StatelessWidget {
  const SoundsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: AudioPlayerShimmer(),
      ),
    );
  }
}
