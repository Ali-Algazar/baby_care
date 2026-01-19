import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/auth/presentation/view/sign_up_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).dontHaveAccount, style: AppTextStyles.body2Ragular),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignUpView.routeName);
          },
          child: Text(
            S.of(context).createAccount,
            style: AppTextStyles.body2Bold,
          ),
        ),
      ],
    );
  }
}
