// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `كل الرعاية في مكان واحد`
  String get onboardingTitle1 {
    return Intl.message(
      'كل الرعاية في مكان واحد',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `سجلي كل لحظة مهمة`
  String get onboardingTitle2 {
    return Intl.message(
      'سجلي كل لحظة مهمة',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `أساس صحي لمستقبل أفضل`
  String get onboardingTitle3 {
    return Intl.message(
      'أساس صحي لمستقبل أفضل',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `دليلك المعتمد لمتابعة تطعيمات طفلك ونموه الصحي، بكل سهولة وأمان.`
  String get onboardingDescription1 {
    return Intl.message(
      'دليلك المعتمد لمتابعة تطعيمات طفلك ونموه الصحي، بكل سهولة وأمان.',
      name: 'onboardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `من مواعيد التطعيمات وسجلات النمو، إلى يومياته وذكرياته التي لا تنسى.`
  String get onboardingDescription2 {
    return Intl.message(
      'من مواعيد التطعيمات وسجلات النمو، إلى يومياته وذكرياته التي لا تنسى.',
      name: 'onboardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `انضمي الآن وابدئي في بناء ملف طفلك الصحي. خطوتك الأولى نحو الاطمئنان على صحته.`
  String get onboardingDescription3 {
    return Intl.message(
      'انضمي الآن وابدئي في بناء ملف طفلك الصحي. خطوتك الأولى نحو الاطمئنان على صحته.',
      name: 'onboardingDescription3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
