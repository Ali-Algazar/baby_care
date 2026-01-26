import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/circle_avatar_linear_color.dart';
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
          CircleAvatarLinearColor(
            radius: 20,
            child: SvgPicture.asset('assets/svg/Baby.svg'),
          ),
          8.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text('١ سنة ٢ شهور ', style: AppTextStyles.captionLight),
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
