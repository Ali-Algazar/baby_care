import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_container.dart';
import 'package:baby_care/core/widgets/custom_divider.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/dark_mode_setting_row.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/language_setting_row.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/settings_item.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileSettingsSection extends StatelessWidget {
  const ProfileSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
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
          LanguageSettingRow(),
          CustomDivider(),
          DarkModeSettingRow(),
        ],
      ),
    );
  }
}
