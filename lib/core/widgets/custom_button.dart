import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 46.h,
        decoration: BoxDecoration(
          gradient: AppColors.primaryL,
          borderRadius: BorderRadius.circular(kbuttonRadius.toDouble()),
        ),
        child: Center(child: Text(title, style: AppTextStyles.btnsBold)),
      ),
    );
  }
}
