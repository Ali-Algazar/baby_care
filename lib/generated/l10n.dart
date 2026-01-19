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

  /// `تخطي`
  String get skip {
    return Intl.message('تخطي', name: 'skip', desc: '', args: []);
  }

  /// `التالي`
  String get next {
    return Intl.message('التالي', name: 'next', desc: '', args: []);
  }

  /// `ابدأ الآن`
  String get startNow {
    return Intl.message('ابدأ الآن', name: 'startNow', desc: '', args: []);
  }

  /// `أهلا بعودتك!`
  String get welcomeBack {
    return Intl.message(
      'أهلا بعودتك!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `سجلي دخولك لمتابعة ملف طفلك.`
  String get loginSubtitle {
    return Intl.message(
      'سجلي دخولك لمتابعة ملف طفلك.',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get emailLabel {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get passwordLabel {
    return Intl.message(
      'كلمة المرور',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `تذكرني`
  String get rememberMe {
    return Intl.message('تذكرني', name: 'rememberMe', desc: '', args: []);
  }

  /// `أدخل البريد الإلكتروني`
  String get emailHint {
    return Intl.message(
      'أدخل البريد الإلكتروني',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `أدخل كلمة المرور`
  String get passwordHint {
    return Intl.message(
      'أدخل كلمة المرور',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `نسيت كلمة المرور؟`
  String get forgotPassword {
    return Intl.message(
      'نسيت كلمة المرور؟',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get loginAction {
    return Intl.message(
      'تسجيل الدخول',
      name: 'loginAction',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب؟`
  String get dontHaveAccount {
    return Intl.message(
      'ليس لديك حساب؟',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `أنشئي حساباً جديداً`
  String get createAccount {
    return Intl.message(
      'أنشئي حساباً جديداً',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب جديد`
  String get signUpTitle {
    return Intl.message(
      'إنشاء حساب جديد',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `خطوتك الأولى نحو متابعة صحة طفلك بكل سهولة`
  String get signUpSubtitle {
    return Intl.message(
      'خطوتك الأولى نحو متابعة صحة طفلك بكل سهولة',
      name: 'signUpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الكامل`
  String get fullNameLabel {
    return Intl.message(
      'الاسم الكامل',
      name: 'fullNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `أدخل الاسم`
  String get fullNameHint {
    return Intl.message('أدخل الاسم', name: 'fullNameHint', desc: '', args: []);
  }

  /// `يكتب هنا الاسم كما هو مدون في بطاقة الرقم القومي`
  String get fullNameHelperText {
    return Intl.message(
      'يكتب هنا الاسم كما هو مدون في بطاقة الرقم القومي',
      name: 'fullNameHelperText',
      desc: '',
      args: [],
    );
  }

  /// `الرقم القومي`
  String get nationalIdLabel {
    return Intl.message(
      'الرقم القومي',
      name: 'nationalIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `أدخل الرقم`
  String get nationalIdHint {
    return Intl.message(
      'أدخل الرقم',
      name: 'nationalIdHint',
      desc: '',
      args: [],
    );
  }

  /// `لماذا نطلب الرقم القومي؟`
  String get whyNationalIdQuestion {
    return Intl.message(
      'لماذا نطلب الرقم القومي؟',
      name: 'whyNationalIdQuestion',
      desc: '',
      args: [],
    );
  }

  /// `نستخدمه لربط حسابك ببيانات طفلك المسجلة في الوحدات الصحية التابعة لوزارة الصحة`
  String get whyNationalIdAnswer {
    return Intl.message(
      'نستخدمه لربط حسابك ببيانات طفلك المسجلة في الوحدات الصحية التابعة لوزارة الصحة',
      name: 'whyNationalIdAnswer',
      desc: '',
      args: [],
    );
  }

  /// `أدخل كلمة مرور قوية`
  String get strongPasswordHint {
    return Intl.message(
      'أدخل كلمة مرور قوية',
      name: 'strongPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `8 أحرف على الأقل`
  String get passwordMinLength {
    return Intl.message(
      '8 أحرف على الأقل',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `بالضغط على إنشاء حساب، أنتِ توافقين على شروط الاستخدام وسياسة الخصوصية`
  String get termsAgreement {
    return Intl.message(
      'بالضغط على إنشاء حساب، أنتِ توافقين على شروط الاستخدام وسياسة الخصوصية',
      name: 'termsAgreement',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب`
  String get createAccountAction {
    return Intl.message(
      'إنشاء حساب',
      name: 'createAccountAction',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب بالفعل؟`
  String get alreadyHaveAccount {
    return Intl.message(
      'لديك حساب بالفعل؟',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `سجل الآن`
  String get signInNow {
    return Intl.message('سجل الآن', name: 'signInNow', desc: '', args: []);
  }

  /// `لا يمكن ترك اسم العرض فارغاً`
  String get errorNameEmpty {
    return Intl.message(
      'لا يمكن ترك اسم العرض فارغاً',
      name: 'errorNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `يجب أن يكون الاسم بين 3 و 20 حرفاً`
  String get errorNameLength {
    return Intl.message(
      'يجب أن يكون الاسم بين 3 و 20 حرفاً',
      name: 'errorNameLength',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال البريد الإلكتروني`
  String get errorEmailEmpty {
    return Intl.message(
      'يرجى إدخال البريد الإلكتروني',
      name: 'errorEmailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال بريد إلكتروني صحيح`
  String get errorEmailInvalid {
    return Intl.message(
      'يرجى إدخال بريد إلكتروني صحيح',
      name: 'errorEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال رقم الهاتف`
  String get errorPhoneEmpty {
    return Intl.message(
      'يرجى إدخال رقم الهاتف',
      name: 'errorPhoneEmpty',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال رقم هاتف مصري صحيح مكون من 11 رقماً`
  String get errorPhoneInvalid {
    return Intl.message(
      'يرجى إدخال رقم هاتف مصري صحيح مكون من 11 رقماً',
      name: 'errorPhoneInvalid',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال كلمة المرور`
  String get errorPasswordEmpty {
    return Intl.message(
      'يرجى إدخال كلمة المرور',
      name: 'errorPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `يجب أن تتكون كلمة المرور من 8 أحرف على الأقل`
  String get errorPasswordShort {
    return Intl.message(
      'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل',
      name: 'errorPasswordShort',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال الرقم القومي`
  String get errorNationalIdEmpty {
    return Intl.message(
      'يرجى إدخال الرقم القومي',
      name: 'errorNationalIdEmpty',
      desc: '',
      args: [],
    );
  }

  /// `يجب أن يتكون الرقم القومي من 14 رقماً`
  String get errorNationalIdInvalid {
    return Intl.message(
      'يجب أن يتكون الرقم القومي من 14 رقماً',
      name: 'errorNationalIdInvalid',
      desc: '',
      args: [],
    );
  }

  /// `كلمات المرور غير متطابقة`
  String get errorPasswordMatch {
    return Intl.message(
      'كلمات المرور غير متطابقة',
      name: 'errorPasswordMatch',
      desc: '',
      args: [],
    );
  }

  /// `يرجى اختيار النوع`
  String get errorGenderEmpty {
    return Intl.message(
      'يرجى اختيار النوع',
      name: 'errorGenderEmpty',
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
