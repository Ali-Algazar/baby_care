import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_up_footer.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_up_form_fields.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_up_header.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/terms_agreement_row.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isCheck = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Constants.khorizontalPadding.horizontal,
        child: Column(
          children: [
            Constants.ktopPadding.height,
            const SignUpHeader(),
            40.height,
            Form(key: formKey, child: const SignUpFormFields()),
            16.height,
            TermsAgreementRow(
              isChecked: isCheck,
              onChanged: (value) {
                setState(() => isCheck = !value);
              },
            ),
            30.height,
            SignUpFooter(
              onCreateAccount: () {
                if (formKey.currentState!.validate()) {}
              },
              onSignIn: () => Navigator.pop(context),
            ),
            Constants.kbottomPadding.height,
          ],
        ),
      ),
    );
  }
}
