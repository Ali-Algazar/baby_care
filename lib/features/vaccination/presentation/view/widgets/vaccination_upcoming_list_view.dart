import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:baby_care/features/vaccination/presentation/view/widgets/vaccination_card_upcoming.dart';
import 'package:flutter/material.dart';

class VaccinationUpcomingListView extends StatelessWidget {
  const VaccinationUpcomingListView({
    super.key,
    required this.vaccinationUpcomingData,
  });
  final List<VaccineRecordModel> vaccinationUpcomingData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vaccinationUpcomingData.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 6, left: 3, right: 3),
        child: VaccinationCardUpcoming(
          vaccineRecordModel: vaccinationUpcomingData[index],
        ),
      ),
    );
  }
}
