import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key, this.onBackPress});
  final VoidCallback? onBackPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(onTap: onBackPress, child: Icon(Icons.arrow_back_ios)),
        Spacer(),
        Text(S.of(context).accountTitle, style: AppTextStyles.headerBold),
        Spacer(),
      ],
    );
  }
}
