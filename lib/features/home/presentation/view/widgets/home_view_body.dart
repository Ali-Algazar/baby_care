import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/cubit/cubit/current_child_cubit.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/children/presentation/cubit/children_state.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:baby_care/features/home/presentation/view/widgets/sounds_section.dart';
import 'package:baby_care/features/home/presentation/view/widgets/vaccination_section.dart';
import 'package:baby_care/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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
    return BlocListener<CurrentChildCubit, String?>(
      listener: (context, state) {
        if (state != null) {
          context.read<VaccinationCubit>().getVaccinationHome(state);
        }
      },
      child: BlocBuilder<ChildrenCubit, ChildrenState>(
        builder: (context, state) {
          if (state is ChildrenLoaded) {
            return Column(
              children: [
                Constants.ktopPadding.height,
                CustomHomeAppBar(child: state.children),
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
                24.height,
                SoundsSection(),
              ],
            );
          }
          if (state is ChildrenLoading) {
            return Center(child: Lottie.asset('assets/animation/loading.json'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
