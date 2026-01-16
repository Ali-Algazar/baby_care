import 'package:baby_care/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:baby_care/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('No route defined'))),
      );
  }
}
