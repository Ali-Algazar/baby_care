import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyValidators {
  static String? displayNameValidator(
    String? displayName,
    BuildContext context,
  ) {
    if (displayName == null || displayName.isEmpty) {
      return S.of(context).errorNameEmpty;
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return S.of(context).errorNameLength;
    }
    return null;
  }

  static String? emailValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).errorEmailEmpty;
    }
    if (!RegExp(
      r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b',
    ).hasMatch(value)) {
      return S.of(context).errorEmailInvalid;
    }
    return null;
  }

  static String? phoneValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).errorPhoneEmpty;
    }
    if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
      return S.of(context).errorPhoneInvalid;
    }
    return null;
  }

  static String? passwordValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).errorPasswordEmpty;
    }
    if (value.length < 8) {
      return S.of(context).errorPasswordShort;
    }
    return null;
  }

  static String? nationalIdValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).errorNationalIdEmpty;
    }
    if (!RegExp(r'^[0-9]{14}$').hasMatch(value)) {
      return S.of(context).errorNationalIdInvalid;
    }
    return null;
  }

  static String? repeatPasswordValidator({
    String? value,
    String? password,
    required BuildContext context,
  }) {
    if (value != password) {
      return S.of(context).errorPasswordMatch;
    }
    return null;
  }

  static String? genderValidator({
    String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return S.of(context).errorGenderEmpty;
    }
    return null;
  }

  // هذه غالباً لا تظهر للمستخدم (Validation داخلي) لكن يمكن ترجمتها لو أردت
  static String? imageValidator(String? image) {
    if (image == null || image.isEmpty) {
      return 'Image cannot be empty';
    }
    return null;
  }

  static String? tokenValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Token cannot be empty';
    }
    return null;
  }
}
