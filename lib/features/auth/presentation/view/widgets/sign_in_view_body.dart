import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/cubit/cubit/locale_cubit.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_state.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/remember_me_row.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_in_footer.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_in_form_fields.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_in_header.dart';
import 'package:baby_care/features/main_layout/presentation/view/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool isCheck = false;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          setState(() => isLoading = false);
        }
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Login Successful')));
          setState(() => isLoading = false);
          Navigator.pushReplacementNamed(
            context,
            MainLayoutView.routeName,
            arguments: state.user,
          );
        }
        if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
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
                    emailController: emailController,
                    passwordController: passwordController,
                    passwordSuffixIcon: showPassword
                        ? 'assets/svg/eye-off.svg'
                        : 'assets/svg/eye.svg',
                    obscureText: showPassword,
                    showPassword: (value) {
                      setState(() {
                        showPassword = !value;
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
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(
                        context,
                      ).login(emailController.text, passwordController.text);
                    }
                  },
                ),
                Constants.kbottomPadding.height,
              ],
            ),
          ),
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
