import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewDetailsButton extends StatelessWidget {
  const ViewDetailsButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 46.h,
        decoration: BoxDecoration(
          color: AppColors.bG,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: WidgetLinearColor(
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).viewDetails, style: AppTextStyles.btnsRagular),
              Icon(Icons.arrow_outward_sharp),
            ],
          ),
        ),
      ),
    );
  }
}
