import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/logout_section.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_app_bar.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_avatar_section.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_other_section.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_security_section.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_settings_section.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_user_name.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Column(
            children: [
              Constants.ktopPadding.height,
              ProfileAppBar(),
              24.height,
              ProfileAvatarSection(),
              ProfileUserName(),
              20.height,
              ProfileSettingsSection(),
              16.height,
              ProfileSecuritySection(),
              16.height,
              ProfileOtherSection(),
              16.height,
              LogoutSection(),
              Constants.kbottomPadding.height,
            ],
          ),
        ),
      ),
    );
  }
}
