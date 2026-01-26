import 'package:baby_care/features/info/presentation/view/widgets/about_us_view_body.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});
  static const String routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AboutUsViewBody());
  }
}
