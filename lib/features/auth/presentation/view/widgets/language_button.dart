import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key, required this.onClick});
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: WidgetLinearColor(
        widget: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: AppColors.success,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Text('Ar', style: AppTextStyles.btnsBold.copyWith(fontSize: 18)),
              8.width,
              SvgPicture.asset('assets/svg/lang.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
