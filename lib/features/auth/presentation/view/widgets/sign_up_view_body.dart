import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_state.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_up_footer.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_up_form_fields.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/sign_up_header.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/terms_agreement_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isCheck = false;
  bool showPassword = false;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    emailController.dispose();
    passwordController.dispose();
    nationalIdController.dispose();
    displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          context.showSnack(state.message, color: Colors.red);
          setState(() => isLoading = false);
        }
        if (state is AuthSuccess) {
          context.showSnack(
            'Account created successfully',
            color: Colors.green,
          );
          setState(() => isLoading = false);
        }
        if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Column(
            children: [
              Constants.ktopPadding.height,
              const SignUpHeader(),
              40.height,
              Form(
                key: formKey,
                child: SignUpFormFields(
                  displayNameController: displayNameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  nationalIdController: nationalIdController,
                  obscureText: showPassword,
                  passwordSuffixIcon: showPassword
                      ? "assets/svg/eye-off.svg"
                      : 'assets/svg/eye.svg',
                  showPassword: (value) {
                    setState(() {
                      showPassword = !value;
                    });
                  },
                ),
              ),
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
                  if (formKey.currentState!.validate()) {
                    if (isCheck) {
                      BlocProvider.of<AuthCubit>(context).register(
                        emailController.text,
                        passwordController.text,
                        nationalIdController.text,
                        displayNameController.text,
                      );
                    } else {
                      context.showSnack(
                        'You must agree to the terms and conditions',
                        color: Colors.red,
                      );
                    }
                  }
                },
                onSignIn: () => Navigator.pop(context),
              ),
              Constants.kbottomPadding.height,
            ],
          ),
        ),
      ),
    );
  }
}
