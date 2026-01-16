import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  PageController pageController = PageController();

  void nextPage() {
    if (pageController.page! < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
    emit(OnboardingInitial());
  }

  void goToPreviousPage() {
    if (pageController.page! > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
    emit(OnboardingInitial());
  }
}
