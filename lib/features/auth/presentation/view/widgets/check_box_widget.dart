import 'package:baby_care/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    super.key,
    required this.onClick,
    required this.isCheck,
  });
  final ValueChanged<bool> onClick;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(isCheck);
      },
      child: AnimatedContainer(
        height: isCheck ? 20.h : 16.h,
        width: isCheck ? 20.w : 16.w,
        decoration: BoxDecoration(
          color: isCheck ? AppColors.success : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.border),
        ),
        duration: Duration(milliseconds: 100),
        child: isCheck
            ? Icon(Icons.check, size: 24, color: Colors.white)
            : SizedBox(),
      ),
    );
  }
}
