import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/validators.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpFormFields extends StatelessWidget {
  const SignUpFormFields({
    super.key,
    required this.obscureText,
    required this.showPassword,
    required this.emailController,
    required this.passwordController,
    required this.nationalIdController,
    required this.passwordSuffixIcon,
    required this.displayNameController,
  });

  final bool obscureText;
  final ValueChanged<bool> showPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nationalIdController;
  final TextEditingController displayNameController;
  final String passwordSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledTextField(
          controller: displayNameController,
          label: S.of(context).fullNameLabel,
          hint: S.of(context).fullNameHint,
          keyboardType: TextInputType.name,
          helper: S.of(context).fullNameHelperText,
          validator: (value) =>
              MyValidators.displayNameValidator(value, context),
        ),
        24.height,
        LabeledTextField(
          controller: nationalIdController,
          label: S.of(context).nationalIdLabel,
          hint: S.of(context).nationalIdHint,
          keyboardType: TextInputType.number,
          helper:
              '${S.of(context).whyNationalIdQuestion} ${S.of(context).whyNationalIdAnswer}',
          validator: (value) =>
              MyValidators.nationalIdValidator(value, context),
        ),
        24.height,
        LabeledTextField(
          controller: emailController,
          label: S.of(context).emailLabel,
          hint: S.of(context).emailHint,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => MyValidators.emailValidator(value, context),
        ),
        24.height,
        LabeledTextField(
          controller: passwordController,
          obscureText: !obscureText,
          label: S.of(context).passwordLabel,
          hint: S.of(context).strongPasswordHint,
          helper: S.of(context).passwordMinLength,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            onPressed: () {
              showPassword(obscureText);
            },
            icon: SvgPicture.asset(passwordSuffixIcon),
          ),
          validator: (value) => MyValidators.passwordValidator(value, context),
        ),
      ],
    );
  }
}
