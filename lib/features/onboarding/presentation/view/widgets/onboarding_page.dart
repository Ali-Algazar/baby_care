import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/helper/shared_preferences_service.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:baby_care/features/onboarding/presentation/model/onboarding_model.dart';
import 'package:baby_care/features/onboarding/presentation/view/widgets/custom_onboarding_app_bar.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.onboardings,
    required this.index,
  });

  final OnboardingModel onboardings;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Constants.ktopPadding.height,
          Stack(
            children: [
              Image.asset(
                onboardings.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              CustomOnBoardingAppBar(index: index),
            ],
          ),

          50.height,

          Padding(
            padding: Constants.khorizontalPadding.horizontal,
            child: Column(
              children: [
                Text(
                  onboardings.title,
                  style: AppTextStyles.headerBold.copyWith(
                    fontSize: 24,
                    fontFamily: Constants.kfontFamily,
                  ),
                ),
                16.height,
                Text(
                  onboardings.description,
                  style: AppTextStyles.body1Ragular.copyWith(
                    fontSize: 20,
                    color: AppColors.dText,
                  ),
                  textAlign: TextAlign.center,
                ),
                70.height,

                CustomButton(
                  title: index == 2
                      ? S.of(context).startNow
                      : S.of(context).next,
                  onTap: () {
                    if (index < 2) {
                      BlocProvider.of<OnboardingCubit>(context).nextPage();
                    } else {
                      SharedPreferencesService.saveData(
                        key: Constants.onBoardingKey,
                        value: true,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Constants.kbottomPadding.height,
        ],
      ),
    );
  }
}
