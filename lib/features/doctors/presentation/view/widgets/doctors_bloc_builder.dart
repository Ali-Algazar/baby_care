import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/empty_view.dart';
import 'package:baby_care/core/widgets/no_internet_connection_view.dart';
import 'package:baby_care/features/doctors/presentation/cubit/get_all_doctors/get_all_doctors_cubit.dart';
import 'package:baby_care/features/doctors/presentation/view/widgets/doctors_view_body_loading.dart';
import 'package:baby_care/features/doctors/presentation/view/widgets/doctors_view_body_success.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDoctorsCubit, GetAllDoctorsState>(
      builder: (context, state) {
        if (state is GetAllDoctorsSuccess) {
          return DoctorsViewBodySuccess(doctors: state.doctors);
        }
        if (state is GetAllDoctorsEmpty) {
          return EmptyView(message: S.of(context).noDoctorsAvailable);
        }
        if (state is GetAllDoctorsLoading) {
          return DoctorsViewBodyLoading();
        }
        if (state is GetAllDoctorsError) {
          if (state.message == 'No internet connection') {
            return NointernetconnectionView();
          }

          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }

        return SliverToBoxAdapter(child: 40.height);
      },
    );
  }
}
