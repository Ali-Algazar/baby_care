import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/onboarding/presentation/data/onboarding_items_list.dart';
import 'package:baby_care/features/onboarding/presentation/model/onboarding_model.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late List<OnboardingModel> onboardings;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onboardings = onboardingItemsList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ktopPadding.height,
        Stack(
          children: [
            Image.asset(
              onboardings[0].image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: khorizontalPadding.horizontal,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_outlined),
                  ),
                  Spacer(),
                  Text(S.of(context).skip, style: AppTextStyles.body2Bold),
                ],
              ),
            ),
          ],
        ),

        Text(
          onboardings[0].title,
          style: AppTextStyles.headerBold.copyWith(
            fontSize: 24,
            fontFamily: kfontFamily,
          ),
        ),
        Text(
          onboardings[0].description,
          style: AppTextStyles.body1Ragular.copyWith(
            fontSize: 20,
            color: AppColors.dText,
          ),
          textAlign: TextAlign.center,
        ),

        Container(
          width: double.infinity,
          height: 46,
          decoration: BoxDecoration(
            gradient: AppColors.primaryL,
            borderRadius: BorderRadius.circular(kbuttonRadius.toDouble()),
          ),
          child: Center(child: Text('jhgjh', style: AppTextStyles.btnsBold)),
        ),
      ],
    );
  }
}
