import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.onBack});
  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(onTap: onBack, child: Icon(Icons.arrow_back_ios_new)),
        Spacer(),
        Text(title, style: AppTextStyles.headerBold),
        Spacer(),
      ],
    );
  }
}
