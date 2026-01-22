import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, this.onBackPress});
  final VoidCallback? onBackPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.khorizontalPadding.horizontal,
      child: Column(
        children: [
          Constants.ktopPadding.height,
          ProfileAppBar(onBackPress: onBackPress),
        ],
      ),
    );
  }
}
