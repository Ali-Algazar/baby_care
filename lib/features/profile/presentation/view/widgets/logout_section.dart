import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/logout_confirmation_dialog.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        logoutDialog(context);
      },
      child: Text(
        S.of(context).logout,
        style: AppTextStyles.body2Bold.copyWith(color: AppColors.danger),
      ),
    );
  }

  Future<dynamic> logoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutConfirmationDialog();
      },
    );
  }
}
