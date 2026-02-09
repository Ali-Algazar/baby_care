import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/home/presentation/view/widgets/app_bar_action_icon.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyHomeAppBar extends StatelessWidget {
  const EmptyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.khorizontalPadding.horizontal,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            child: SvgPicture.asset('assets/svg/logo.svg', height: 40),
          ),
          8.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).welcome, style: AppTextStyles.textStyle15),
              Text(
                S.of(context).appName,
                style: AppTextStyles.captionRagular.copyWith(
                  color: AppColors.dText,
                ),
              ),
            ],
          ),
          const Spacer(),
          AppBarActionIcon(
            onTab: () {},
            svgIconPath: 'assets/svg/notifications.svg',
          ),
        ],
      ),
    );
  }
}
