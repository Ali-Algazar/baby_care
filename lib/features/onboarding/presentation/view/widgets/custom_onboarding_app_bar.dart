import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/helper/shared_preferences_service.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/auth/presentation/view/sign_in_view.dart';
import 'package:baby_care/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOnBoardingAppBar extends StatelessWidget {
  const CustomOnBoardingAppBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.khorizontalPadding.horizontal,
      child: Row(
        children: [
          index == 0
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    BlocProvider.of<OnboardingCubit>(
                      context,
                    ).goToPreviousPage();
                  },
                  icon: Icon(Icons.arrow_back_outlined),
                ),
          Spacer(),

          index == 2
              ? const SizedBox()
              : TextButton(
                  onPressed: () async {
                    await SharedPreferencesService.saveData(
                      key: Constants.onBoardingKey,
                      value: true,
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignInView.routeName,
                      (route) => false,
                    );
                  },
                  child: Text(
                    S.of(context).skip,
                    style: AppTextStyles.body2Bold.copyWith(
                      color: AppColors.mText,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
