import 'package:baby_care/features/sounds/presentation/view/widgets/sounds_view_body.dart';
import 'package:flutter/material.dart';

class SoundsView extends StatelessWidget {
  const SoundsView({super.key});
  static const String routeName = '/sounds';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SoundsViewBody());
  }
}
