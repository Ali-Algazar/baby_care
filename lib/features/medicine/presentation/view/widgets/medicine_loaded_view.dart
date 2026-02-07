import 'package:baby_care/features/medicine/data/model/medicine_model.dart';
import 'package:baby_care/features/medicine/presentation/view/widgets/medicine_card_widget.dart';
import 'package:flutter/material.dart';

class MedicineLoadedView extends StatelessWidget {
  const MedicineLoadedView({super.key, required this.medicines});
  final List<MedicineModel> medicines;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: medicines.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.88,
      ),
      itemBuilder: (context, index) =>
          MedicineCardWidget(model: medicines[index]),
    );
  }
}
