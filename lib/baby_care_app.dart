import 'package:baby_care/core/cubit/cubit/locale_cubit.dart';
import 'package:baby_care/core/helper_functions/on_generate_routes.dart';
import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/core/theme/app_theme.dart';
import 'package:baby_care/features/auth/data/repositories/auth_repository.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:baby_care/features/children/data/repositories/children_repository.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/main_layout/presentation/cubit/navigation_cubit.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BabyCareApp extends StatelessWidget {
  const BabyCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(
          create: (context) => AuthCubit(authRepository: sl<AuthRepository>()),
        ),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(
          create: (context) =>
              ChildrenCubit(repository: sl<ChildrenRepository>()),
        ),
      ],
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                locale: Locale(state),

                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: onGenerateRoute,
                theme: AppTheme.lightTheme,
              );
            },
          );
        },
      ),
    );
  }
}
