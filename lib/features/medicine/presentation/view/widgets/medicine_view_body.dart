import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/header_tap.dart';
import 'package:baby_care/features/medicine/presentation/view/widgets/medicine_bloc_builder.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class MedicineViewBody extends StatelessWidget {
  const MedicineViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: HeaderTap(title: S.of(context).allMedicines),
          ),
        ),
        SliverToBoxAdapter(child: 24.height),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: MedicineBlocBuilder(),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }
}
