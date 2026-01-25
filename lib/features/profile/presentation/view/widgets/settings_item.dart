import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    required this.titel,
    required this.onTap,
  });
  final String icon;
  final String titel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        8.width,
        Text(titel, style: AppTextStyles.body2Bold),
        Spacer(),
        Icon(Icons.arrow_forward_ios, color: AppColors.dText),
      ],
    );
  }
}
