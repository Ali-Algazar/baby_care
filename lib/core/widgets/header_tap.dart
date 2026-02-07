import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderTap extends StatelessWidget {
  const HeaderTap({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.headerBold),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.border),
            ),
            child: SvgPicture.asset('assets/svg/leading.svg'),
          ),
        ),
      ],
    );
  }
}
