import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/sounds/presentation/cubit/sounds_cubit.dart';
import 'package:baby_care/features/sounds/presentation/cubit/sounds_state.dart';
import 'package:baby_care/features/sounds/presentation/view/widgets/audio_player_card.dart';
import 'package:baby_care/features/sounds/presentation/view/widgets/audio_player_shimmer.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SoundsBlocBuilder extends StatelessWidget {
  const SoundsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoundsCubit, SoundsState>(
      builder: (context, state) {
        if (state is SoundsLoaded) {
          return SliverList.builder(
            itemCount: state.sounds.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              child: AudioPlayerCard(soundModel: state.sounds[index]),
            ),
          );
        }
        if (state is SoundsLoading) {
          return SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              child: AudioPlayerShimmer(),
            ),
          );
        }
        if (state is SoundsError) {
          if (state.message == 'No internet connection') {
            return SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    40.height,
                    SvgPicture.asset('assets/svg/no-wifi.svg', height: 100),
                    16.height,
                    Text(
                      S.of(context).noInternetConnection,
                      style: AppTextStyles.headerBold,
                    ),
                  ],
                ),
              ),
            );
          }

          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        if (state is SoundsEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  40.height,
                  SvgPicture.asset('assets/svg/box-empty.svg', height: 100),
                  16.height,
                  Text(
                    S.of(context).noSoundsCurrently,
                    style: AppTextStyles.headerBold,
                  ),
                ],
              ),
            ),
          );
        }
        return SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
