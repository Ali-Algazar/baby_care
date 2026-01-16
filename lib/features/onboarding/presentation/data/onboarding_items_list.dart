import 'package:baby_care/features/onboarding/presentation/model/onboarding_model.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

List<OnboardingModel> onboardingItemsList(BuildContext context) {
  return [
    OnboardingModel(
      image: 'assets/image/onboarding_image1.png',
      title: S.of(context).onboardingTitle1,
      description: S.of(context).onboardingDescription1,
    ),
    OnboardingModel(
      image: 'assets/image/onboarding_image2.png',
      title: S.of(context).onboardingTitle2,
      description: S.of(context).onboardingDescription2,
    ),
    OnboardingModel(
      image: 'assets/image/onboarding_image3.png',
      title: S.of(context).onboardingTitle3,
      description: S.of(context).onboardingDescription3,
    ),
  ];
}
