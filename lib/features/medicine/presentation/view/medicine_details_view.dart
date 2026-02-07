import 'package:baby_care/features/medicine/data/model/medicine_model.dart';
import 'package:baby_care/features/medicine/presentation/view/widgets/medicine_details_view_body.dart';
import 'package:flutter/material.dart';

class MedicineDetailsView extends StatelessWidget {
  const MedicineDetailsView({super.key});
  static const routeName = '/medicine_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MedicineDetailsViewBody(
        model: ModalRoute.of(context)!.settings.arguments as MedicineModel,
      ),
    );
  }
}
