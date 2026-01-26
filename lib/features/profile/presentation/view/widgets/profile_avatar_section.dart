import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/widgets/circle_avatar_linear_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAvatarSection extends StatelessWidget {
  const ProfileAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatarLinearColor(
          radius: 70,
          child: SvgPicture.asset(
            'assets/svg/avatartion.svg',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 3,
          left: 10,
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 17,
              backgroundColor: AppColors.mText,
              child: const Icon(Icons.edit, size: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
