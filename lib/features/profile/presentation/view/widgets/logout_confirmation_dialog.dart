import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/logout_cancel_button.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/logout_confirm_button.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // لتدوير الحواف
      ),
      child: Container(
        height: 320,

        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/image/Being.png'),

            Text(
              S.of(context).logoutConfirmation,
              style: AppTextStyles.body1Bold,
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(child: LogoutConfirmButton()),
                Expanded(child: LogoutCancelButton()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
