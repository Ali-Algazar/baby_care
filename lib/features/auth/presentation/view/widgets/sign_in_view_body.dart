import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/cubit/cubit/locale_cubit.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/remember_me_row.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_in_footer.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_in_form_fields.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_in_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool isCheck = false;
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Constants.khorizontalPadding.horizontal,
        child: Column(
          children: [
            Constants.ktopPadding.height,
            SignInHeader(
              onLanguagePressed: () => onLanguageButtonPressed(context),
            ),
            40.height,
            Form(
              key: formKey,
              child: SignInFormFields(
                obscureText: showPassword,
                showPassword: (value) {
                  setState(() {
                    showPassword = value;
                  });
                },
              ),
            ),
            14.height,
            RememberMeRow(
              isChecked: isCheck,
              onChanged: (value) {
                setState(() => isCheck = !value);
              },
              onForgotPassword: () {},
            ),
            60.height,
            SignInFooter(
              onLogin: () {
                if (formKey.currentState!.validate()) {}
              },
            ),
            Constants.kbottomPadding.height,
          ],
        ),
      ),
    );
  }

  void onLanguageButtonPressed(BuildContext context) async {
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 100,
        50,
        16,
        0,
      ),

      items: [
        PopupMenuItem(value: 'ar', child: Text('العربية')),
        PopupMenuItem(value: 'en', child: Text('English')),
      ],
    );
    if (selected != null) {
      BlocProvider.of<LocaleCubit>(context).changeLocale(selected);
    }
  }
}
