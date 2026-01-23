import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/circle_avatar_linear_color.dart';
import 'package:baby_care/core/widgets/custom_container.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_app_bar.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Constants.khorizontalPadding.horizontal,
        child: Column(
          children: [
            Constants.ktopPadding.height,
            ProfileAppBar(),
            24.height,
            Stack(
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
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: AppColors.mText,
                      child: Icon(Icons.edit, size: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            Text('علي محمد', style: AppTextStyles.textStyle20),

            20.height,
            CustomContainer(
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).settingsTitle,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.mText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SettingsItem(
                    icon: 'assets/svg/child.svg',
                    titel: S.of(context).myChildren,
                    onTap: () {},
                  ),
                  Divider(height: 1, color: AppColors.graphic),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/iconsax-global-edit.svg'),
                      8.width,
                      Text(
                        S.of(context).language,
                        style: AppTextStyles.body2Bold,
                      ),
                      Spacer(),
                      Text(
                        S.of(context).langArabic,
                        style: AppTextStyles.body1Bold.copyWith(
                          color: AppColors.dText,
                        ),
                      ),
                      8.width,
                      Icon(Icons.arrow_forward_ios, color: AppColors.dText),
                    ],
                  ),
                  CustomDivider(),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/moon.svg'),
                      8.width,
                      Text(
                        S.of(context).darkMode,
                        style: AppTextStyles.body2Bold,
                      ),
                      Spacer(),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                        activeThumbColor: Colors.white,

                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            16.height,
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(
                    S.of(context).securityTitle,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.mText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SettingsItem(
                    icon: 'assets/svg/lock-key.svg',
                    titel: S.of(context).changePassword,
                    onTap: () {},
                  ),
                  CustomDivider(),
                  SettingsItem(
                    icon: 'assets/svg/security-check.svg',
                    titel: S.of(context).twoFactorAuth,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            16.height,
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(
                    S.of(context).sectionOther,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.mText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SettingsItem(
                    icon: 'assets/svg/share-08.svg',
                    titel: S.of(context).shareApp,
                    onTap: () {},
                  ),
                  CustomDivider(),
                  SettingsItem(
                    icon: 'assets/svg/falling-star.svg',
                    titel: S.of(context).rateApp,
                    onTap: () {},
                  ),
                  CustomDivider(),
                  SettingsItem(
                    icon: 'assets/svg/customer-service-01.svg',
                    titel: S.of(context).helpAndSupport,
                    onTap: () {},
                  ),
                  CustomDivider(),
                  SettingsItem(
                    icon: 'assets/svg/file-unlocked.svg',
                    titel: S.of(context).privacyPolicy,
                    onTap: () {},
                  ),
                  CustomDivider(),
                  SettingsItem(
                    icon: 'assets/svg/information-circle.svg',
                    titel: S.of(context).aboutUs,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            16.height,
            TextButton(
              onPressed: () {},
              child: Text(
                S.of(context).logout,
                style: AppTextStyles.body2Bold.copyWith(
                  color: AppColors.danger,
                ),
              ),
            ),
            Constants.kbottomPadding.height,
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: AppColors.graphic);
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    required this.titel,
    required this.onTap,
  });
  final String icon;
  final String titel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        8.width,
        Text(titel, style: AppTextStyles.body2Bold),
        Spacer(),
        Icon(Icons.arrow_forward_ios, color: AppColors.dText),
      ],
    );
  }
}
