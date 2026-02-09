import 'package:flutter/material.dart';
import 'widgets/medicine_view_body.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MedicineViewBody());
  }
}
