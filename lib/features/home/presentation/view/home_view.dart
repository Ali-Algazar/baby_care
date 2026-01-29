import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/core/widgets/circle_avatar_linear_color.dart';
import 'package:baby_care/features/vaccination/data/repositories/vaccination_repository.dart';
import 'package:baby_care/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VaccinationCubit(sl<VaccinationRepository>()),
      child: SafeArea(
        child: Scaffold(
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
        ),
      ),
    );
  }
}
