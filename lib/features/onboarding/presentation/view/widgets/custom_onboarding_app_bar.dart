import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingAppBar extends StatelessWidget {
  const CustomOnBoardingAppBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: khorizontalPadding.horizontal,
      child: Row(
        children: [
          index == 0
              ? const SizedBox()
              : IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_outlined),
                ),
          Spacer(),

          index == 2
              ? const SizedBox()
              : TextButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).skip,
                    style: AppTextStyles.body2Bold.copyWith(
                      color: AppColors.mText,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
