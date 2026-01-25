import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/utils/validators.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showCurrentPassword = false;
  bool showNewPassword = false;
  bool showConfirmPassword = false;
  bool passordHas8Chars = false;
  bool passwordHasSpecialChar = false;
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Constants.khorizontalPadding.horizontal,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Constants.ktopPadding.height,
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  Spacer(),
                  Text(
                    S.of(context).changePassword,
                    style: AppTextStyles.headerBold,
                  ),
                  Spacer(),
                ],
              ),
              40.height,
              LabeledTextField(
                label: S.of(context).currentPassword,
                hint: '••••••••',
                obscureText: !showCurrentPassword,
                controller: currentPasswordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showCurrentPassword = !showCurrentPassword;
                    });
                  },
                  icon: SvgPicture.asset(
                    showCurrentPassword
                        ? 'assets/svg/eye-off.svg'
                        : 'assets/svg/eye.svg',
                    colorFilter: ColorFilter.mode(
                      AppColors.dText,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              24.height,
              LabeledTextField(
                label: S.of(context).newPassword,
                hint: '••••••••',
                obscureText: !showNewPassword,
                controller: newPasswordController,
                validator: (value) =>
                    MyValidators.passwordValidator(value, context),
                onChanged: (value) {
                  setState(() {
                    passordHas8Chars = value.length >= 8;
                    passwordHasSpecialChar = RegExp(
                      r'[!@#$%^&*(),.?":{}|<>]',
                    ).hasMatch(value);
                  });
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showNewPassword = !showNewPassword;
                    });
                  },
                  icon: SvgPicture.asset(
                    showNewPassword
                        ? 'assets/svg/eye-off.svg'
                        : 'assets/svg/eye.svg',
                  ),
                ),
              ),
              24.height,
              LabeledTextField(
                label: S.of(context).confirmNewPassword,
                hint: '••••••••',
                obscureText: !showConfirmPassword,
                controller: confirmPasswordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                  icon: SvgPicture.asset(
                    showConfirmPassword
                        ? 'assets/svg/eye-off.svg'
                        : 'assets/svg/eye.svg',
                  ),
                ),
                helper: S.of(context).reEnterPassword,
                validator: (value) => value != newPasswordController.text
                    ? S.of(context).errorPasswordMatch
                    : null,
              ),
              16.height,
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: passordHas8Chars
                          ? AppColors.success
                          : AppColors.border,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                      weight: 10,
                    ),
                  ),
                  8.width,
                  Text(
                    S.of(context).passwordHintChars,
                    style: AppTextStyles.btnsRagular,
                  ),
                ],
              ),
              12.height,
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: passwordHasSpecialChar
                          ? AppColors.success
                          : AppColors.border,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                      weight: 10,
                    ),
                  ),
                  8.width,
                  Text(
                    S.of(context).passwordHintSymbols,
                    style: AppTextStyles.btnsRagular,
                  ),
                ],
              ),
              Spacer(),
              CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
                title: S.of(context).saveAndChangePassword,
              ),
              Constants.kbottomPadding.height,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
