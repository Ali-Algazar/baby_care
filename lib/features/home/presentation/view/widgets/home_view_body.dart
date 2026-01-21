import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/auth/data/model/user_model.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart'; // تأكد إنك مستخدم الباكدج دي
import 'package:baby_care/features/home/presentation/view/widgets/vaccination_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _currentIndex = 0;

  final PageController vaccinationController = PageController(
    viewportFraction: 0.67,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Constants.ktopPadding.height,
        CustomHomeAppBar(
          user: UserModel(id: 'g', name: 'name', email: 'email'),
        ),
        22.height,
        VaccinationSection(
          currentIndex: _currentIndex,
          controller: vaccinationController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ],
    );
  }
}
