import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/home/data/model/sleep_sounds_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SleepSoundsCard extends StatelessWidget {
  const SleepSoundsCard({super.key, required this.sleepSoundsCardModel});
  final SleepSoundsCardModel sleepSoundsCardModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: sleepSoundsCardModel.ontap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary),
        ),
        child: Row(
          children: [
            WidgetLinearColor(
              widget: Text(
                sleepSoundsCardModel.title,
                style: AppTextStyles.body1Bold,
              ),
            ),
            Spacer(),
            SvgPicture.asset(sleepSoundsCardModel.icon),
          ],
        ),
      ),
    );
  }
}
