import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/validators.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInFormFields extends StatelessWidget {
  const SignInFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledTextField(
          label: S.of(context).emailLabel,
          hint: S.of(context).emailHint,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => MyValidators.emailValidator(value, context),
        ),
        24.height,
        LabeledTextField(
          label: S.of(context).passwordLabel,
          hint: S.of(context).passwordHint,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/eye.svg'),
          ),
          validator: (value) => MyValidators.passwordValidator(value, context),
        ),
      ],
    );
  }
}
