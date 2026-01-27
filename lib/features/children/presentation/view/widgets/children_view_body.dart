import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_appbar.dart';
import 'package:baby_care/features/children/data/model/child_model.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              ChildCard(
                childModel: ChildModel(
                  id: '',
                  name: 'علي محمد',
                  gender: 'male',
                  dateOfBirth: DateTime(2023, 4, 15),
                ),
              ),
            ],
          ),
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
            childModel.gender == 'male'
                ? 'assets/svg/Baby.svg'
                : 'assets/svg/girl.svg',
            height: 50,
          ),
          Column(
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
