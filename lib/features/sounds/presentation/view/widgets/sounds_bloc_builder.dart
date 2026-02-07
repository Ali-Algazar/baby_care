import 'package:baby_care/core/widgets/empty_view.dart';
import 'package:baby_care/core/widgets/no_internet_connection_view.dart';
import 'package:baby_care/features/sounds/presentation/cubit/sounds_cubit.dart';
import 'package:baby_care/features/sounds/presentation/cubit/sounds_state.dart';
import 'package:baby_care/features/sounds/presentation/view/widgets/sounds_loaded_view.dart';
import 'package:baby_care/features/sounds/presentation/view/widgets/sounds_loading_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoundsBlocBuilder extends StatelessWidget {
  const SoundsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoundsCubit, SoundsState>(
      builder: (context, state) {
        if (state is SoundsLoaded) {
          return SoundsLoadedView(sounds: state.sounds);
        }
        if (state is SoundsLoading) {
          return SoundsLoadingView();
        }
        if (state is SoundsError) {
          if (state.message == 'No internet connection') {
            return NointernetconnectionView();
          }

          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        if (state is SoundsEmpty) {
          return EmptyView(message: S.of(context).noSoundsCurrently);
        }
        return SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
