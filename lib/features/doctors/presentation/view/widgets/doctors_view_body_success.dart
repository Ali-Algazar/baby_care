import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/doctors/data/model/doctor_model.dart';
import 'package:baby_care/features/doctors/presentation/view/widgets/doctor_card_widget.dart';
import 'package:flutter/material.dart';

class DoctorsViewBodySuccess extends StatelessWidget {
  const DoctorsViewBodySuccess({super.key, required this.doctors});
  final List<DoctorModel> doctors;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: 16.horizontal,
      sliver: SliverGrid.builder(
        itemCount: doctors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.86,
        ),
        itemBuilder: (context, index) =>
            DoctorCardWidget(doctorModel: doctors[index]),
      ),
    );
  }
}
