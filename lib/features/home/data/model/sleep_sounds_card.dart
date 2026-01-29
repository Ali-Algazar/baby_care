import 'dart:ui';

class SleepSoundsCardModel {
  final String title;
  final String icon;
  final VoidCallback ontap;

  const SleepSoundsCardModel({
    required this.title,
    required this.icon,
    required this.ontap,
  });
}
