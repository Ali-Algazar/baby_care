import 'package:baby_care/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController newPasswordController;
  final bool showPassword;
  final VoidCallback onToggle;

  const ConfirmPasswordField({
    super.key,
    required this.controller,
    required this.newPasswordController,
    required this.showPassword,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledTextField(
      controller: controller,
      label: S.of(context).confirmNewPassword,
      hint: '••••••••',
      obscureText: !showPassword,
      helper: S.of(context).reEnterPassword,
      validator: (value) => value != newPasswordController.text
          ? S.of(context).errorPasswordMatch
          : null,
      suffixIcon: IconButton(
        onPressed: onToggle,
        icon: SvgPicture.asset(
          showPassword ? 'assets/svg/eye-off.svg' : 'assets/svg/eye.svg',
        ),
      ),
    );
  }
}
