import 'package:flutter/material.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.onBackPress});
  final VoidCallback? onBackPress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProfileViewBody(onBackPress: onBackPress)),
    );
  }
}
