import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:baby_care/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:baby_care/features/vaccination/presentation/cubit/vaccination_state.dart';
import 'package:baby_care/features/vaccination/presentation/view/widgets/vaccination_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VaccinationTabView extends StatelessWidget {
  const VaccinationTabView({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VaccinationCubit, VaccinationState>(
      builder: (context, state) {
        if (state is VaccinationLoading) {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        } else if (state is VaccinationError) {
          return Expanded(child: Center(child: Text(state.message)));
        }
        if (state is VaccinationLoaded && state.vaccinationData.isEmpty) {
          return Expanded(
            child: Center(child: Text('S.of(context).noVaccinationsAvailable')),
          );
        }
        if (state is VaccinationLoaded) {
          return Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: VaccinationUpcomingListView(
                    vaccinationUpcomingData:
                        state.vaccinationData[0] as List<VaccineRecordModel>,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: VaccinationPreviousListView(
                    vaccinationPreviousData:
                        state.vaccinationData[1] as List<VaccineRecordModel>,
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
