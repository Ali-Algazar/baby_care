import 'package:baby_care/core/widgets/circle_avatar_linear_color.dart';
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
        icon: CircleAvatarLinearColor(
          radius: 28,
          child: SvgPicture.asset(
            'assets/svg/robot.svg',
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }
}
