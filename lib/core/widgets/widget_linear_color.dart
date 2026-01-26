import 'package:baby_care/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class WidgetLinearColor extends StatelessWidget {
  const WidgetLinearColor({
    super.key,
    required this.widget,
    this.linearGradient = AppColors.primaryL,
  });
  final Widget widget;
  final LinearGradient linearGradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return linearGradient.createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: widget,
    );
  }
}
