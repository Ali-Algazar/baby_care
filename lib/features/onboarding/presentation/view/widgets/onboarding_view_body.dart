import 'package:baby_care/features/onboarding/presentation/data/onboarding_items_list.dart';
import 'package:baby_care/features/onboarding/presentation/model/onboarding_model.dart';
import 'package:baby_care/features/onboarding/presentation/view/widgets/onboarding_page.dart';
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
    return PageView.builder(
      itemCount: onboardings.length,
      itemBuilder: (context, index) {
        return OnboardingPage(onboardings: onboardings[index], index: index);
      },
    );
  }
}
