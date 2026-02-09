import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/features/blog/data/repositories/blog_repository.dart';
import 'package:baby_care/features/blog/presentation/cubit/blog_cubit.dart';
import 'package:baby_care/features/doctors/data/repositories/doctors_repository.dart';
import 'package:baby_care/features/doctors/presentation/cubit/get_all_doctors/get_all_doctors_cubit.dart';
import 'package:baby_care/features/medicine/data/repositories/medicine_repository.dart';
import 'package:baby_care/features/medicine/presentation/cubit/medicine_cubit.dart';
import 'package:baby_care/features/sounds/data/repositories/sounds_repository.dart';
import 'package:baby_care/features/sounds/presentation/cubit/sounds_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/services_view_body.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key, this.initialIndex});
  static const String routeName = '/servicesView';
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SoundsCubit(sl<SoundsRepository>())..fetchSounds(),
        ),
        BlocProvider(
          create: (context) =>
              MedicineCubit(sl<MedicineRepository>())..getAllMedicines(),
        ),
        BlocProvider(
          create: (context) =>
              BlogCubit(sl<BlogRepository>())..fetchBlogArticles(),
        ),
        BlocProvider(
          create: (context) =>
              GetAllDoctorsCubit(sl<DoctorsRepository>())..getAllDoctors(),
        ),
      ],
      child: Scaffold(body: ServicesViewBody()),
    );
  }
}
