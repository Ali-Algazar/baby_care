import 'package:baby_care/core/app_svg.dart';
import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/cubit/cubit/locale_cubit.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/utils/validators.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/check_box_widget.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/dont_have_account_row.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/language_button.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool isCheck = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Column(
            children: [
              Constants.ktopPadding.height,
              Stack(
                children: [
                  Center(child: SvgPicture.asset(AppSvg.splashLogo)),

                  Positioned(
                    top: 16,
                    right: 16,
                    child: LanguageButton(
                      onClick: () async {
                        onLanguageButtonPressed(context);
                      },
                    ),
                  ),
                ],
              ),

              40.height,
              Text(S.of(context).welcomeBack, style: AppTextStyles.headerBold),
              8.height,
              Text(
                S.of(context).loginSubtitle,
                style: AppTextStyles.textStyle18,
                textAlign: TextAlign.center,
              ),
              40.height,
              LabeledTextField(
                label: S.of(context).emailLabel,
                hint: S.of(context).emailHint,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return MyValidators.emailValidator(value, context);
                },
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
                validator: (value) {
                  return MyValidators.passwordValidator(value, context);
                },
              ),
              14.height,

              Row(
                children: [
                  CheckboxWidget(
                    onClick: (value) {
                      setState(() {
                        isCheck = !value;
                      });
                    },
                    isCheck: isCheck,
                  ),
                  8.height,
                  Text(
                    S.of(context).rememberMe,
                    style: AppTextStyles.body2Ragular.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.dText,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: WidgetLinearColor(
                      widget: Text(
                        S.of(context).forgotPassword,
                        style: AppTextStyles.body2Ragular,
                      ),
                    ),
                  ),
                ],
              ),
              60.height,
              CustomButton(
                title: S.of(context).loginAction,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print('object');
                  }
                },
              ),
              8.width,
              DontHaveAccountRow(),
              Constants.kbottomPadding.height,
            ],
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
