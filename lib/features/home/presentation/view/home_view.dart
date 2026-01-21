import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            WidgetLinearColor(widget: CircleAvatar(radius: 28)),

            SvgPicture.asset('assets/svg/robot.svg', width: 35, height: 35),
          ],
        ),
      ),
    );
  }
}
