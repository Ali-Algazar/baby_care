import 'package:baby_care/core/app_svg.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppSvg.splashLogo),
        40.height,
        Text(S.of(context).signUpTitle, style: AppTextStyles.headerBold),
        8.height,
        Text(
          S.of(context).signUpSubtitle,
          style: AppTextStyles.textStyle18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
