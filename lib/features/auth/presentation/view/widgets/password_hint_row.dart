import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PasswordHintRow extends StatelessWidget {
  final bool isValid;
  final String text;

  const PasswordHintRow({super.key, required this.isValid, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: isValid ? AppColors.success : AppColors.border,
          child: const Icon(Icons.check, size: 14, color: Colors.white),
        ),
        const SizedBox(width: 8),
        Text(text, style: AppTextStyles.btnsRagular),
      ],
    );
  }
}
