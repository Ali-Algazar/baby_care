import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/dont_have_account_row.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignInFooter extends StatelessWidget {
  final VoidCallback onLogin;

  const SignInFooter({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(title: S.of(context).loginAction, onTap: onLogin),
        8.height,
        const DontHaveAccountRow(),
      ],
    );
  }
}
