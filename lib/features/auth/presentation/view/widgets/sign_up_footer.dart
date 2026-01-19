import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignUpFooter extends StatelessWidget {
  final VoidCallback onCreateAccount;
  final VoidCallback onSignIn;

  const SignUpFooter({
    super.key,
    required this.onCreateAccount,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          title: S.of(context).createAccountAction,
          onTap: onCreateAccount,
        ),
        12.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).alreadyHaveAccount,
              style: AppTextStyles.body2Ragular,
            ),
            TextButton(
              onPressed: onSignIn,
              child: WidgetLinearColor(
                widget: Text(
                  S.of(context).signInNow,
                  style: AppTextStyles.body2Bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
