import 'package:baby_care/core/widgets/custom_divider.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_container.dart';
import 'package:baby_care/features/auth/presentation/view/change_password_view.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/settings_item.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileSecuritySection extends StatelessWidget {
  const ProfileSecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
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
            onTap: () {
              Navigator.pushNamed(context, ChangePasswordView.routeName);
            },
          ),
          CustomDivider(),
          SettingsItem(
            icon: 'assets/svg/security-check.svg',
            titel: S.of(context).twoFactorAuth,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
