import 'dart:ui';

import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_container.dart';
import 'package:baby_care/core/widgets/custom_divider.dart';
import 'package:baby_care/features/info/presentation/view/about_us_view.dart';
import 'package:baby_care/features/info/presentation/view/policy_view.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/settings_item.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileOtherSection extends StatelessWidget {
  const ProfileOtherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
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
            onTap: () {
              Navigator.pushNamed(context, PolicyView.routeName);
            },
          ),
          CustomDivider(),
          SettingsItem(
            icon: 'assets/svg/information-circle.svg',
            titel: S.of(context).aboutUs,
            onTap: () {
              Navigator.pushNamed(context, AboutUsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
