import 'package:baby_care/core/utils/validators.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool showPassword;
  final VoidCallback onToggle;
  final ValueChanged<String> onChanged;

  const NewPasswordField({
    super.key,
    required this.controller,
    required this.showPassword,
    required this.onToggle,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledTextField(
      controller: controller,
      label: S.of(context).newPassword,
      hint: '••••••••',
      obscureText: !showPassword,
      validator: (value) => MyValidators.passwordValidator(value, context),
      onChanged: onChanged,
      suffixIcon: IconButton(
        onPressed: onToggle,
        icon: SvgPicture.asset(
          showPassword ? 'assets/svg/eye-off.svg' : 'assets/svg/eye.svg',
        ),
      ),
    );
  }
}
