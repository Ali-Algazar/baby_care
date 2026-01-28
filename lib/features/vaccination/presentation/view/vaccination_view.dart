import 'package:baby_care/core/cubit/cubit/current_child_cubit.dart';
import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/features/vaccination/data/repositories/vaccination_repository.dart';
import 'package:baby_care/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/vaccination_view_body.dart';

class VaccinationView extends StatelessWidget {
  const VaccinationView({super.key});

  static const routeName = '/vaccination';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VaccinationCubit(sl<VaccinationRepository>())
        ..getVaccination(BlocProvider.of<CurrentChildCubit>(context).state!),
      child: const Scaffold(body: VaccinationViewBody()),
    );
  }
}
