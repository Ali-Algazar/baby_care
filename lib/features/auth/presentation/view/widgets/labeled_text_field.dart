import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_text_form_field.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    this.hint,
    this.helper,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
  });
  final String label;
  final String? hint;
  final String? helper;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppTextStyles.body1Bold),

            WidgetLinearColor(widget: Text('*')),
          ],
        ),
        8.height,
        CustomTextFormField(
          hint: hint,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          validator: validator,
        ),

        if (helper != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              Text(
                helper!,
                style: AppTextStyles.body2Ragular.copyWith(
                  color: AppColors.dText,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
