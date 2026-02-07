import 'package:baby_care/features/medicine/presentation/view/widgets/medicine_card_shimmer.dart';
import 'package:flutter/material.dart';

class MedicineLoadingView extends StatelessWidget {
  const MedicineLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.88,
      ),
      itemBuilder: (context, index) => MedicineCardShimmer(),
    );
  }
}
