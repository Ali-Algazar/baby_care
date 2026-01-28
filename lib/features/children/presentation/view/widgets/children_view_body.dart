import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_appbar.dart';
import 'package:baby_care/features/children/data/model/child_model.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/children/presentation/cubit/children_state.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class ChildrenViewBody extends StatelessWidget {
  const ChildrenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Column(
            children: [
              Constants.ktopPadding.height,
              CustomAppBar(
                title: S.of(context).myChildren,
                onBack: () {
                  Navigator.pop(context);
                },
              ),
              40.height,
              BlocBuilder<ChildrenCubit, ChildrenState>(
                builder: (context, state) {
                  print(state);
                  if (state is ChildrenLoading) {
                    return ChildCardShimmerListView();
                  }
                  if (state is ChildrenError) {
                    return Text(
                      state.message,
                      style: AppTextStyles.body2Bold.copyWith(
                        color: AppColors.danger,
                      ),
                    );
                  }
                  if (state is ChildrenEmpty) {
                    return Text('ChildrenEmpty');
                  }
                  if (state is ChildrenLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.children.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ChildCard(childModel: state.children[index]),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ChildCard(
                        childModel: ChildModel(
                          id: 'id',
                          name: 'علي محمد علي',
                          gender: 'male',
                          dateOfBirth: DateTime(2002, 4, 9),
                        ),
                      ),
                    ),
                  );
                  // return ChildCard(
                  //   childModel: ChildModel(
                  //     id: '',
                  //     name: 'علي محمد',
                  //     gender: 'male',
                  //     dateOfBirth: DateTime(2023, 4, 15),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildCardShimmerListView extends StatelessWidget {
  const ChildCardShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ChildCardShimmer(),
      ),
      itemCount: 3,
    );
  }
}

class ChildCardShimmer extends StatelessWidget {
  const ChildCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: AppColors.bG1.withValues(alpha: 0.04),
      child: Container(
        width: double.infinity,

        padding: 16.all,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.graphic, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          spacing: 16,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Container(height: 10, width: 80, color: AppColors.gray4),
                Container(height: 10, width: 60, color: AppColors.gray4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChildCard extends StatelessWidget {
  const ChildCard({super.key, required this.childModel});

  final ChildModel childModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 16.all,
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.bG1, width: 2),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withValues(alpha: 0.04),

            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: Color(0xFF000000).withValues(alpha: 0.06),

            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        spacing: 16,
        children: [
          SvgPicture.asset(
            childModel.gender == 'boy'
                ? 'assets/svg/Baby.svg'
                : 'assets/svg/girl.svg',
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(childModel.name, style: AppTextStyles.textStyle15),

              Text(
                calculateAge(childModel.dateOfBirth),
                style: AppTextStyles.captionRagular.copyWith(
                  color: AppColors.dText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String calculateAge(DateTime birthDate) {
    final now = DateTime.now();

    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;

    // لو اليوم الحالي أقل من يوم الميلاد
    if (now.day < birthDate.day) {
      months--;
    }

    // لو الشهور بالسالب
    if (months < 0) {
      years--;
      months += 12;
    }

    String yearText = years > 0 ? '$years سنة' : '';
    String monthText = months > 0 ? '$months شهر' : '';

    if (yearText.isNotEmpty && monthText.isNotEmpty) {
      return '$yearText $monthText';
    } else if (yearText.isNotEmpty) {
      return yearText;
    } else {
      return monthText;
    }
  }
}
