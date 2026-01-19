import 'package:baby_care/features/auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignUpViewBody());
  }
}
