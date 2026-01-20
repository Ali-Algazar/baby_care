import 'package:baby_care/core/app_svg.dart';
import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/shared_preferences_service.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_state.dart';
import 'package:baby_care/features/auth/presentation/view/sign_in_view.dart';
import 'package:baby_care/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  late Animation<double> rotation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    BlocProvider.of<AuthCubit>(context).checkAuth();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccess) {
          navigateToNextView('');
        }
        if (state is Unauthenticated) {
          bool onBoardingCompleted =
              await SharedPreferencesService.getData(
                key: Constants.onBoardingKey,
              ) ??
              false;
          if (onBoardingCompleted) {
            navigateToNextView(SignInView.routeName);
          } else {
            navigateToNextView(OnboardingView.routeName);
          }
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.primaryL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: rotation.value,
                  child: Transform.scale(scale: scale.value, child: child),
                );
              },
              child: SvgPicture.asset(AppSvg.splashLogo),
            ),
          ],
        ),
      ),
    );
  }

  void initAnimations() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800), // 4 × 700ms
    );

    // Scale: تصغير → ثابت أثناء اللفة → ثابت أثناء الرجوع → تكبير
    scale = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 0.7,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25, // 700ms
      ),
      TweenSequenceItem(tween: ConstantTween<double>(0.7), weight: 25),
      TweenSequenceItem(tween: ConstantTween<double>(0.7), weight: 25),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.7,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 25,
      ),
    ]).animate(controller);

    // Rotation: ثابت أثناء التصغير → لف 180° → رجوع → ثابت أثناء التكبير
    rotation = TweenSequence([
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 25),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: -pi,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -pi,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 25),
    ]).animate(controller);

    controller.repeat();
  }

  void navigateToNextView(String routeName) {
    Future.delayed(const Duration(milliseconds: 2800), () {
      controller.stop();
      Navigator.pushReplacementNamed(context, routeName);
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}
