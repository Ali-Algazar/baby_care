import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CurrentPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool showPassword;
  final String? errorText;
  final VoidCallback onToggle;

  const CurrentPasswordField({
    super.key,
    required this.controller,
    required this.showPassword,
    required this.onToggle,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledTextField(
      controller: controller,
      label: S.of(context).currentPassword,
      hint: '••••••••',
      errorText: errorText,
      obscureText: !showPassword,
      suffixIcon: IconButton(
        onPressed: onToggle,
        icon: SvgPicture.asset(
          showPassword ? 'assets/svg/eye-off.svg' : 'assets/svg/eye.svg',
          colorFilter: ColorFilter.mode(AppColors.dText, BlendMode.srcIn),
        ),
      ),
      validator: (value) => value == null || value.isEmpty
          ? S.of(context).errorPasswordEmpty
          : null,
    );
  }
}
