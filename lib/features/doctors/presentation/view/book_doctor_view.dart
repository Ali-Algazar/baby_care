import 'package:baby_care/features/doctors/data/model/doctor_model.dart';
import 'package:baby_care/features/doctors/presentation/view/widgets/book_doctor_view_body.dart';
import 'package:flutter/material.dart';

class BookDoctorView extends StatelessWidget {
  const BookDoctorView({super.key});
  static const String routeName = '/book-doctor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDoctorViewBody(
        doctorModel: ModalRoute.of(context)!.settings.arguments as DoctorModel,
      ),
    );
  }
}
