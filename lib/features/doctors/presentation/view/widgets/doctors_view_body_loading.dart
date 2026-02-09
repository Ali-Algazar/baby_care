import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/doctors/presentation/view/widgets/doctor_card_shimmer.dart';
import 'package:flutter/material.dart';

class DoctorsViewBodyLoading extends StatelessWidget {
  const DoctorsViewBodyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: 16.horizontal,
      sliver: SliverGrid.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.86,
        ),
        itemBuilder: (context, index) => DoctorCardShimmer(),
      ),
    );
  }
}
