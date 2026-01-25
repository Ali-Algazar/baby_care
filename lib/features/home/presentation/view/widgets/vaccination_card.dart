import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class VaccinationCard extends StatelessWidget {
  const VaccinationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        width: context.width / 1.9,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.gray4,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.bG1, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BCG – الدرن', style: AppTextStyles.textStyle15),
            8.height,
            Row(
              children: [
                Text(
                  S.of(context).vaccinationDate,
                  style: AppTextStyles.body2Ragular.copyWith(
                    color: AppColors.dText,
                  ),
                ),
                4.width,
                Text('٢٥ يناير ٢٠٢٦', style: AppTextStyles.body2Ragular),
              ],
            ),
            8.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              color: Colors.yellow.withValues(alpha: 0.45),
              child: Text(
                '${S.of(context).timeAfter} 10 ${S.of(context).unitDays}',
                style: AppTextStyles.captionRagular,
              ),
            ),
            16.height,

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: S.of(context).remindMe,
                    onTap: () {},
                  ),
                ),
                8.width,
                Expanded(
                  child: CustomButton(
                    title: S.of(context).remindMe,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
