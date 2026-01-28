import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/features/auth/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/change_password_header.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/confirm_password_field.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/current_password_field.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/new_password_field.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/password_hint_row.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/password_changed_success_dialog.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final _formKey = GlobalKey<FormState>();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool showCurrentPassword = false;
  bool showNewPassword = false;
  bool showConfirmPassword = false;

  bool has8Chars = false;
  bool hasSpecialChar = false;

  bool isLoading = false;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: _blocListener,
      child: SafeArea(
        child: SingleChildScrollView(
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Padding(
              padding: Constants.khorizontalPadding.horizontal,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Constants.ktopPadding.height,
                    const ChangePasswordHeader(),
                    40.height,

                    CurrentPasswordField(
                      controller: currentPasswordController,
                      showPassword: showCurrentPassword,
                      errorText: errorText,
                      onToggle: () => setState(
                        () => showCurrentPassword = !showCurrentPassword,
                      ),
                    ),

                    24.height,

                    NewPasswordField(
                      controller: newPasswordController,
                      showPassword: showNewPassword,
                      onToggle: () =>
                          setState(() => showNewPassword = !showNewPassword),
                      onChanged: (value) {
                        setState(() {
                          has8Chars = value.length >= 8;
                          hasSpecialChar = RegExp(
                            r'[!@#$%^&*(),.?":{}|<>]',
                          ).hasMatch(value);
                        });
                      },
                    ),

                    24.height,

                    ConfirmPasswordField(
                      controller: confirmPasswordController,
                      newPasswordController: newPasswordController,
                      showPassword: showConfirmPassword,
                      onToggle: () => setState(
                        () => showConfirmPassword = !showConfirmPassword,
                      ),
                    ),

                    16.height,
                    PasswordHintRow(
                      isValid: has8Chars,
                      text: S.of(context).passwordHintChars,
                    ),
                    12.height,
                    PasswordHintRow(
                      isValid: hasSpecialChar,
                      text: S.of(context).passwordHintSymbols,
                    ),
                    40.height,
                    CustomButton(
                      title: S.of(context).saveAndChangePassword,
                      onTap: _onSubmit,
                    ),

                    Constants.kbottomPadding.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<ChangePasswordCubit>().changePassword(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );
    }
  }

  void _blocListener(BuildContext context, ChangePasswordState state) {
    if (state is ChangePasswordLoading) {
      setState(() {
        isLoading = true;
        errorText = null;
      });
    } else if (state is ChangePasswordSuccess) {
      setState(() => isLoading = false);
      showDialog(
        context: context,
        builder: (_) => const PasswordChangedSuccessDialog(),
      );
    } else if (state is ChangePasswordFailure) {
      if (state.errorMessage ==
          'Change password failed with status code: 401') {
        setState(() {
          errorText = S.of(context).errorIncorrectPassword;
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
