import 'package:flutter/material.dart';
import 'widgets/doctors_view_body.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DoctorsViewBody());
  }
}
