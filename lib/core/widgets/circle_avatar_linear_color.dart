import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:flutter/material.dart';

class CircleAvatarLinearColor extends StatelessWidget {
  const CircleAvatarLinearColor({
    super.key,
    required this.radius,
    required this.child,
    this.linearGradient = AppColors.primaryL,
  });
  final double radius;
  final Widget child;
  final LinearGradient linearGradient;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        FittedBox(
          child: WidgetLinearColor(
            widget: CircleAvatar(radius: radius),
            linearGradient: linearGradient,
          ),
        ),

        child,
      ],
    );
  }
}
