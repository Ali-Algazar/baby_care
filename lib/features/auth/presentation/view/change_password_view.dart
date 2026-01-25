import 'package:baby_care/features/auth/presentation/view/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String routeName = '/change-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const ChangePasswordViewBody());
  }
}
