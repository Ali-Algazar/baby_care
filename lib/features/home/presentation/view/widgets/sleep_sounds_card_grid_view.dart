import 'package:baby_care/features/home/data/model/sleep_sounds_card.dart';
import 'package:baby_care/features/home/presentation/view/widgets/sleep_sounds_card.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class SleepSoundsCardGridView extends StatelessWidget {
  const SleepSoundsCardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        mainAxisSpacing: 16,
        mainAxisExtent: 55,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final List<SleepSoundsCardModel> sleepSoundsCardModel = [
          SleepSoundsCardModel(
            title: S.of(context).recentlyPlayed,
            icon: 'assets/svg/iconsax-clock.svg',
            ontap: () {},
          ),
          SleepSoundsCardModel(
            title: S.of(context).favorites,
            icon: 'assets/svg/heart-rounded.svg',
            ontap: () {},
          ),
          SleepSoundsCardModel(
            title: S.of(context).trending,
            icon: 'assets/svg/line-chart-up-02.svg',
            ontap: () {},
          ),
          SleepSoundsCardModel(
            title: S.of(context).recommendedForYou,
            icon: 'assets/svg/sparkles.svg',
            ontap: () {},
          ),
        ];
        return SleepSoundsCard(
          sleepSoundsCardModel: sleepSoundsCardModel[index],
        );
      },
    );
  }
}
