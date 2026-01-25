import 'package:baby_care/features/auth/presentation/view/change_password_view.dart';
import 'package:baby_care/features/auth/presentation/view/sign_in_view.dart';
import 'package:baby_care/features/auth/presentation/view/sign_up_view.dart';
import 'package:baby_care/features/main_layout/presentation/view/main_layout_view.dart';
import 'package:baby_care/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:baby_care/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());

    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());
    case ChangePasswordView.routeName:
      return MaterialPageRoute(builder: (context) => ChangePasswordView());
    case MainLayoutView.routeName:
      return MaterialPageRoute(builder: (context) => MainLayoutView());

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('No route defined'))),
      );
  }
}
