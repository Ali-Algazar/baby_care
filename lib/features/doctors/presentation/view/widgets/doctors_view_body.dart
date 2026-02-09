import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/header_tap.dart';
import 'package:baby_care/features/doctors/presentation/view/widgets/doctors_bloc_builder.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: HeaderTap(title: S.of(context).allDoctors),
          ),
        ),
        SliverToBoxAdapter(child: 24.height),

        DoctorsBlocBuilder(),

        SliverToBoxAdapter(child: 40.height),
      ],
    );
  }
}
