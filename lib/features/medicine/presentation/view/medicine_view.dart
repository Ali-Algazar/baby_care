import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/features/medicine/data/repositories/medicine_repository.dart';
import 'package:baby_care/features/medicine/presentation/cubit/medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/medicine_view_body.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MedicineCubit(sl<MedicineRepository>())..getAllMedicines(),
      child: const Scaffold(body: MedicineViewBody()),
    );
  }
}
