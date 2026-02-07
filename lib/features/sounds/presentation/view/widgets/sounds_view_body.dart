import 'package:baby_care/core/widgets/header_tap.dart';
import 'package:baby_care/features/sounds/presentation/view/widgets/sounds_bloc_builder.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class SoundsViewBody extends StatelessWidget {
  const SoundsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: HeaderTap(title: S.of(context).allSounds),
          ),
        ),

        SoundsBlocBuilder(),

        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }
}
