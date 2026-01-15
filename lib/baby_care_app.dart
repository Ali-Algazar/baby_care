import 'package:baby_care/core/cubit/cubit/locale_cubit.dart';
import 'package:baby_care/core/helper_functions/on_generate_routes.dart';
import 'package:baby_care/core/theme/app_theme.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BabyCareApp extends StatelessWidget {
  const BabyCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, state) {
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
      ),
    );
  }
}
