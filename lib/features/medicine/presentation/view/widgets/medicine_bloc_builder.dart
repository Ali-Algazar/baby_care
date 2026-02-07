import 'package:baby_care/core/widgets/empty_view.dart';
import 'package:baby_care/core/widgets/no_internet_connection_view.dart';
import 'package:baby_care/features/medicine/presentation/cubit/medicine_cubit.dart';
import 'package:baby_care/features/medicine/presentation/cubit/medicine_state.dart';
import 'package:baby_care/features/medicine/presentation/view/widgets/medicine_loaded_view.dart';
import 'package:baby_care/features/medicine/presentation/view/widgets/medicine_loading_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineBlocBuilder extends StatelessWidget {
  const MedicineBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineState>(
      builder: (context, state) {
        if (state is MedicineLoaded) {
          return MedicineLoadedView(medicines: state.medicines);
        }
        if (state is MedicineLoading) {
          return MedicineLoadingView();
        }
        if (state is MedicineError) {
          if (state.message == 'No internet connection') {
            return NointernetconnectionView();
          }

          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        if (state is MedicineEmpty) {
          return EmptyView(message: S.current.noMedicinesAvailable);
        }

        return SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
