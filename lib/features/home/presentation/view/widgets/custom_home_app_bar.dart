import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/auth/data/model/user_model.dart';
import 'package:baby_care/features/home/presentation/view/widgets/app_bar_action_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.khorizontalPadding.horizontal,
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/Baby.svg', height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('علي محمد', style: AppTextStyles.textStyle15),

              Text(
                '١ سنة ٢ شهور ',
                style: AppTextStyles.captionRagular.copyWith(
                  color: AppColors.dText,
                ),
              ),
            ],
          ),
          Spacer(),
          AppBarActionIcon(
            onTab: () {},
            svgIconPath: 'assets/svg/notifications.svg',
          ),
          4.width,
          AppBarActionIcon(onTab: () {}, svgIconPath: 'assets/svg/switch.svg'),
        ],
      ),
    );
  }
}
