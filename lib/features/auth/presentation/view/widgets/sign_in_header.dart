import 'package:baby_care/core/app_svg.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/language_button.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInHeader extends StatelessWidget {
  final VoidCallback onLanguagePressed;

  const SignInHeader({super.key, required this.onLanguagePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Center(child: SvgPicture.asset(AppSvg.splashLogo)),
            Positioned(
              top: 16,
              right: 16,
              child: LanguageButton(onClick: onLanguagePressed),
            ),
          ],
        ),
        40.height,
        Text(S.of(context).welcomeBack, style: AppTextStyles.headerBold),
        8.height,
        Text(
          S.of(context).loginSubtitle,
          style: AppTextStyles.textStyle18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
