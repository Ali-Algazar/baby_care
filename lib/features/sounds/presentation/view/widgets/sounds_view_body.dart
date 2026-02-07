import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/sounds/presentation/view/widgets/sounds_bloc_builder.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SoundsViewBody extends StatelessWidget {
  const SoundsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text(S.of(context).allSounds, style: AppTextStyles.headerBold),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: SvgPicture.asset('assets/svg/leading.svg'),
                ),
              ],
            ),
          ),
        ),

        SoundsBlocBuilder(),

        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }
}
