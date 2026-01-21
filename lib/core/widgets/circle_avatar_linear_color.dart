import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleAvatarLinearColor extends StatelessWidget {
  const CircleAvatarLinearColor({
    super.key,
    required this.radius,
    required this.child,
  });
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        WidgetLinearColor(widget: CircleAvatar(radius: radius)),

        child,
      ],
    );
  }
}
