import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle headerBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.mText,
  );
  static TextStyle textStyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.dText,
  );
  static TextStyle textStyle15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.mText,
  );
  static TextStyle headerRagular = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle body1Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle body1Ragular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle body2Bold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: Constants.kfontFamily,
  );
  static TextStyle body2Ragular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle btnsBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.bG,
  );
  static TextStyle btnsRagular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle captionLight = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle captionRagular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
}
