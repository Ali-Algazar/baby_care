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

  /// `الرجاء إدخال البريد الإلكتروني وكلمة المرور`
  String get errorLoginEmpty {
    return Intl.message(
      'الرجاء إدخال البريد الإلكتروني وكلمة المرور',
      name: 'errorLoginEmpty',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني أو كلمة المرور غير صحيحة`
  String get errorLoginInvalid {
    return Intl.message(
      'البريد الإلكتروني أو كلمة المرور غير صحيحة',
      name: 'errorLoginInvalid',
      desc: '',
      args: [],
    );
  }
<<<<<<< Updated upstream
=======

  /// `الرئيسية`
  String get navHome {
    return Intl.message('الرئيسية', name: 'navHome', desc: '', args: []);
  }

  /// `المتابعة`
  String get navTracking {
    return Intl.message('المتابعة', name: 'navTracking', desc: '', args: []);
  }

  /// `الخدمات`
  String get navServices {
    return Intl.message('الخدمات', name: 'navServices', desc: '', args: []);
  }

  /// `المجتمع`
  String get navCommunity {
    return Intl.message('المجتمع', name: 'navCommunity', desc: '', args: []);
  }

  /// `الحساب`
  String get navAccount {
    return Intl.message('الحساب', name: 'navAccount', desc: '', args: []);
  }

  /// `التطعيم القادم`
  String get nextVaccination {
    return Intl.message(
      'التطعيم القادم',
      name: 'nextVaccination',
      desc: '',
      args: [],
    );
  }

  /// `عرض الكل`
  String get viewAll {
    return Intl.message('عرض الكل', name: 'viewAll', desc: '', args: []);
  }

  /// `موعد التطعيم:`
  String get vaccinationDate {
    return Intl.message(
      'موعد التطعيم:',
      name: 'vaccinationDate',
      desc: '',
      args: [],
    );
  }

  /// `عرض التفاصيل`
  String get viewDetails {
    return Intl.message(
      'عرض التفاصيل',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `ذكرني`
  String get remindMe {
    return Intl.message('ذكرني', name: 'remindMe', desc: '', args: []);
  }

  /// `الأصوات المساعدة للنوم`
  String get sleepSounds {
    return Intl.message(
      'الأصوات المساعدة للنوم',
      name: 'sleepSounds',
      desc: '',
      args: [],
    );
  }

  /// `سمعتها مؤخراً`
  String get recentlyPlayed {
    return Intl.message(
      'سمعتها مؤخراً',
      name: 'recentlyPlayed',
      desc: '',
      args: [],
    );
  }

  /// `المفضلة`
  String get favorites {
    return Intl.message('المفضلة', name: 'favorites', desc: '', args: []);
  }

  /// `الرائج`
  String get trending {
    return Intl.message('الرائج', name: 'trending', desc: '', args: []);
  }

  /// `مقترحة لك`
  String get recommendedForYou {
    return Intl.message(
      'مقترحة لك',
      name: 'recommendedForYou',
      desc: '',
      args: [],
    );
  }

  /// `الرائج في المجتمع`
  String get trendingInCommunity {
    return Intl.message(
      'الرائج في المجتمع',
      name: 'trendingInCommunity',
      desc: '',
      args: [],
    );
  }

  /// `بعد`
  String get timeAfter {
    return Intl.message('بعد', name: 'timeAfter', desc: '', args: []);
  }

  /// `أيام`
  String get unitDays {
    return Intl.message('أيام', name: 'unitDays', desc: '', args: []);
  }

  /// `الحساب`
  String get accountTitle {
    return Intl.message('الحساب', name: 'accountTitle', desc: '', args: []);
  }

  /// `الإعدادات`
  String get settingsTitle {
    return Intl.message('الإعدادات', name: 'settingsTitle', desc: '', args: []);
  }

  /// `أطفالي`
  String get myChildren {
    return Intl.message('أطفالي', name: 'myChildren', desc: '', args: []);
  }

  /// `اللغة`
  String get language {
    return Intl.message('اللغة', name: 'language', desc: '', args: []);
  }

  /// `الوضع الليلي`
  String get darkMode {
    return Intl.message('الوضع الليلي', name: 'darkMode', desc: '', args: []);
  }

  /// `الحماية`
  String get securityTitle {
    return Intl.message('الحماية', name: 'securityTitle', desc: '', args: []);
  }

  /// `تغيير الرقم السري`
  String get changePassword {
    return Intl.message(
      'تغيير الرقم السري',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `المصادقة الثنائية`
  String get twoFactorAuth {
    return Intl.message(
      'المصادقة الثنائية',
      name: 'twoFactorAuth',
      desc: '',
      args: [],
    );
  }

  /// `أخرى`
  String get sectionOther {
    return Intl.message('أخرى', name: 'sectionOther', desc: '', args: []);
  }

  /// `شارك التطبيق`
  String get shareApp {
    return Intl.message('شارك التطبيق', name: 'shareApp', desc: '', args: []);
  }

  /// `قيم التطبيق`
  String get rateApp {
    return Intl.message('قيم التطبيق', name: 'rateApp', desc: '', args: []);
  }

  /// `المساعدة والدعم`
  String get helpAndSupport {
    return Intl.message(
      'المساعدة والدعم',
      name: 'helpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `من نحن`
  String get aboutUs {
    return Intl.message('من نحن', name: 'aboutUs', desc: '', args: []);
  }

  /// `تسجيل الخروج`
  String get logout {
    return Intl.message('تسجيل الخروج', name: 'logout', desc: '', args: []);
  }

  /// `سياسة الخصوصية`
  String get privacyPolicy {
    return Intl.message(
      'سياسة الخصوصية',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `تغيير الصورة`
  String get changePhoto {
    return Intl.message(
      'تغيير الصورة',
      name: 'changePhoto',
      desc: '',
      args: [],
    );
  }

  /// `التقاط صورة`
  String get takePhoto {
    return Intl.message('التقاط صورة', name: 'takePhoto', desc: '', args: []);
  }

  /// `اختار من الألبوم`
  String get chooseFromGallery {
    return Intl.message(
      'اختار من الألبوم',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `اختار أفاتار`
  String get chooseAvatar {
    return Intl.message(
      'اختار أفاتار',
      name: 'chooseAvatar',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get langArabic {
    return Intl.message('العربية', name: 'langArabic', desc: '', args: []);
  }

  /// `الإنجليزية`
  String get langEnglish {
    return Intl.message('الإنجليزية', name: 'langEnglish', desc: '', args: []);
  }

  /// `كلمة المرور الحالية`
  String get currentPassword {
    return Intl.message(
      'كلمة المرور الحالية',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الجديدة`
  String get newPassword {
    return Intl.message(
      'كلمة المرور الجديدة',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور الجديدة`
  String get confirmNewPassword {
    return Intl.message(
      'تأكيد كلمة المرور الجديدة',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `أعيدي كتابة كلمة المرور`
  String get reEnterPassword {
    return Intl.message(
      'أعيدي كتابة كلمة المرور',
      name: 'reEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `8 أرقام وحروف`
  String get passwordHintChars {
    return Intl.message(
      '8 أرقام وحروف',
      name: 'passwordHintChars',
      desc: '',
      args: [],
    );
  }

  /// `استخدم رمز واحد على الأقل من الرموز`
  String get passwordHintSymbols {
    return Intl.message(
      'استخدم رمز واحد على الأقل من الرموز',
      name: 'passwordHintSymbols',
      desc: '',
      args: [],
    );
  }

  /// `حفظ وتغيير كلمة المرور`
  String get saveAndChangePassword {
    return Intl.message(
      'حفظ وتغيير كلمة المرور',
      name: 'saveAndChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور غير صحيحة`
  String get errorIncorrectPassword {
    return Intl.message(
      'كلمة المرور غير صحيحة',
      name: 'errorIncorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `تم تغيير كلمة المرور بنجاح`
  String get passwordChangedSuccess {
    return Intl.message(
      'تم تغيير كلمة المرور بنجاح',
      name: 'passwordChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `أدخل الرمز`
  String get enterCode {
    return Intl.message('أدخل الرمز', name: 'enterCode', desc: '', args: []);
  }

  /// `لقد أرسلنا رمزاً مكوناً من 4 أرقام إلى البريد الإلكتروني`
  String get otpSentMessage {
    return Intl.message(
      'لقد أرسلنا رمزاً مكوناً من 4 أرقام إلى البريد الإلكتروني',
      name: 'otpSentMessage',
      desc: '',
      args: [],
    );
  }

  /// `تحقق`
  String get verifyAction {
    return Intl.message('تحقق', name: 'verifyAction', desc: '', args: []);
  }

  /// `لم أستلم الرمز`
  String get codeNotReceived {
    return Intl.message(
      'لم أستلم الرمز',
      name: 'codeNotReceived',
      desc: '',
      args: [],
    );
  }

  /// `إعادة إرسال`
  String get resend {
    return Intl.message('إعادة إرسال', name: 'resend', desc: '', args: []);
  }

  /// `العودة إلى الرئيسية`
  String get backToHome {
    return Intl.message(
      'العودة إلى الرئيسية',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `اكتب هنا`
  String get writeHerePlaceholder {
    return Intl.message(
      'اكتب هنا',
      name: 'writeHerePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `يكتب.....`
  String get typingIndicator {
    return Intl.message(
      'يكتب.....',
      name: 'typingIndicator',
      desc: '',
      args: [],
    );
  }

  /// `هل أنت متأكد من أنك تريد تسجيل الخروج؟`
  String get logoutConfirmation {
    return Intl.message(
      'هل أنت متأكد من أنك تريد تسجيل الخروج؟',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get yes {
    return Intl.message('نعم', name: 'yes', desc: '', args: []);
  }

  /// `إلغاء`
  String get cancel {
    return Intl.message('إلغاء', name: 'cancel', desc: '', args: []);
  }

  /// `# سياسة الخصوصية\n\nمرحباً بك في تطبيق **[خطوة]**.\n\nنحن نلتزم بحماية خصوصيتك وضمان أمان بياناتك الشخصية وبيانات أطفالك. توضح سياسة الخصوصية هذه أنواع المعلومات التي نجمعها، وكيفية استخدامها، وحقوقك فيما يتعلق بهذه البيانات.\n\n## 1. المعلومات التي نجمعها\n\nنجمع المعلومات التالية لتقديم خدمات الرعاية الصحية والتتبع:\n\n### أ. المعلومات الشخصية\n* **بيانات الوالدين:** الاسم الكامل، البريد الإلكتروني، كلمة المرور (مشفرة)، و**الرقم القومي** (لأغراض التحقق من الهوية وربط البيانات بالوحدات الصحية).\n* **بيانات الطفل:** الاسم، تاريخ الميلاد، النوع، والرقم القومي للطفل (لتكوين الملف الطبي).\n\n### ب. البيانات الصحية\n* سجلات التطعيمات (المواعيد، الحالة، والتواريخ الفعلية).\n* سجلات النمو (الوزن، الطول، ومحيط الرأس).\n* السجلات اليومية (النوم، الرضاعة، وتغيير الحفاضات).\n\n### ج. أذونات الجهاز\n* **الكاميرا ومعرض الصور:** لتمكينك من رفع صورة الملف الشخصي أو صور للمقالات واليوميات.\n* **الموقع الجغرافي (Location):** نستخدمه فقط عند طلبك للبحث عن أقرب طبيب أو وحدة صحية في منطقتك.\n\n## 2. كيف نستخدم معلوماتك\n\nنستخدم البيانات للأغراض التالية:\n1.  **إنشاء وإدارة الحساب:** لتمكينك من الدخول واستخدام التطبيق.\n2.  **التتبع الصحي:** لعرض جداول التطعيمات ومنحنيات النمو الخاصة بطفلك.\n3.  **الإشعارات:** لإرسال تذكيرات بمواعيد التطعيمات الهامة أو التحديثات الصحية.\n4.  **الربط الحكومي:** (إن وجد) لمزامنة سجلات التطعيم مع قاعدة بيانات الوحدات الصحية.\n\n## 3. حماية ومشاركة البيانات\n\n* **الأمان:** نستخدم تقنيات تشفير متقدمة (مثل تشفير كلمات المرور وبروتوكول HTTPS) لحماية بياناتك أثناء النقل والتخزين.\n* **المشاركة:** نحن لا نبيع بياناتك لأطراف ثالثة. قد نشارك البيانات فقط مع:\n    * مقدمي الخدمات السحابية (مثل استضافة الصور وقواعد البيانات) لتشغيل التطبيق.\n    * الجهات الصحية الرسمية (في حال كان التطبيق يتطلب ذلك لتوثيق التطعيمات).\n\n## 4. حذف الحساب والبيانات\n\nلديك الحق الكامل في التحكم ببياناتك:\n* يمكنك تعديل بياناتك من خلال صفحة "الملف الشخصي".\n* يمكنك طلب **حذف الحساب نهائياً** من خلال إعدادات التطبيق. عند الحذف، سيتم محو بيانات الدخول الخاصة بك، وفك ارتباط سجلات الطفل بحسابك.\n\n## 5. خدمات الطرف الثالث\n\nقد يستخدم التطبيق مكتبات خارجية لتحسين الأداء، مثل:\n* Google Firebase (للإشعارات والتحليلات).\n* Cloudinary (لتخزين الصور).\n\n## 6. اتصل بنا\n\nإذا كان لديك أي استفسار بخصوص سياسة الخصوصية، يرجى التواصل معنا عبر:\n* **البريد الإلكتروني:** [ilamohamed7@gmail.com]`
  String get privacyPolicyText {
    return Intl.message(
      '# سياسة الخصوصية\n\nمرحباً بك في تطبيق **[خطوة]**.\n\nنحن نلتزم بحماية خصوصيتك وضمان أمان بياناتك الشخصية وبيانات أطفالك. توضح سياسة الخصوصية هذه أنواع المعلومات التي نجمعها، وكيفية استخدامها، وحقوقك فيما يتعلق بهذه البيانات.\n\n## 1. المعلومات التي نجمعها\n\nنجمع المعلومات التالية لتقديم خدمات الرعاية الصحية والتتبع:\n\n### أ. المعلومات الشخصية\n* **بيانات الوالدين:** الاسم الكامل، البريد الإلكتروني، كلمة المرور (مشفرة)، و**الرقم القومي** (لأغراض التحقق من الهوية وربط البيانات بالوحدات الصحية).\n* **بيانات الطفل:** الاسم، تاريخ الميلاد، النوع، والرقم القومي للطفل (لتكوين الملف الطبي).\n\n### ب. البيانات الصحية\n* سجلات التطعيمات (المواعيد، الحالة، والتواريخ الفعلية).\n* سجلات النمو (الوزن، الطول، ومحيط الرأس).\n* السجلات اليومية (النوم، الرضاعة، وتغيير الحفاضات).\n\n### ج. أذونات الجهاز\n* **الكاميرا ومعرض الصور:** لتمكينك من رفع صورة الملف الشخصي أو صور للمقالات واليوميات.\n* **الموقع الجغرافي (Location):** نستخدمه فقط عند طلبك للبحث عن أقرب طبيب أو وحدة صحية في منطقتك.\n\n## 2. كيف نستخدم معلوماتك\n\nنستخدم البيانات للأغراض التالية:\n1.  **إنشاء وإدارة الحساب:** لتمكينك من الدخول واستخدام التطبيق.\n2.  **التتبع الصحي:** لعرض جداول التطعيمات ومنحنيات النمو الخاصة بطفلك.\n3.  **الإشعارات:** لإرسال تذكيرات بمواعيد التطعيمات الهامة أو التحديثات الصحية.\n4.  **الربط الحكومي:** (إن وجد) لمزامنة سجلات التطعيم مع قاعدة بيانات الوحدات الصحية.\n\n## 3. حماية ومشاركة البيانات\n\n* **الأمان:** نستخدم تقنيات تشفير متقدمة (مثل تشفير كلمات المرور وبروتوكول HTTPS) لحماية بياناتك أثناء النقل والتخزين.\n* **المشاركة:** نحن لا نبيع بياناتك لأطراف ثالثة. قد نشارك البيانات فقط مع:\n    * مقدمي الخدمات السحابية (مثل استضافة الصور وقواعد البيانات) لتشغيل التطبيق.\n    * الجهات الصحية الرسمية (في حال كان التطبيق يتطلب ذلك لتوثيق التطعيمات).\n\n## 4. حذف الحساب والبيانات\n\nلديك الحق الكامل في التحكم ببياناتك:\n* يمكنك تعديل بياناتك من خلال صفحة "الملف الشخصي".\n* يمكنك طلب **حذف الحساب نهائياً** من خلال إعدادات التطبيق. عند الحذف، سيتم محو بيانات الدخول الخاصة بك، وفك ارتباط سجلات الطفل بحسابك.\n\n## 5. خدمات الطرف الثالث\n\nقد يستخدم التطبيق مكتبات خارجية لتحسين الأداء، مثل:\n* Google Firebase (للإشعارات والتحليلات).\n* Cloudinary (لتخزين الصور).\n\n## 6. اتصل بنا\n\nإذا كان لديك أي استفسار بخصوص سياسة الخصوصية، يرجى التواصل معنا عبر:\n* **البريد الإلكتروني:** [ilamohamed7@gmail.com]',
      name: 'privacyPolicyText',
      desc: '',
      args: [],
    );
  }
>>>>>>> Stashed changes
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
