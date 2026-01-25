import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class LogoutCancelButton extends StatelessWidget {
  const LogoutCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),

      child: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.danger),
        ),
        child: Center(
          child: Text(
            S.of(context).cancel,
            style: AppTextStyles.body2Bold.copyWith(color: AppColors.danger),
          ),
        ),
      ),
    );
  }
}
