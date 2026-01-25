import 'package:baby_care/core/cubit/cubit/locale_cubit.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LanguageSettingRow extends StatelessWidget {
  const LanguageSettingRow({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.watch<LocaleCubit>().state == 'ar';

    return Row(
      children: [
        SvgPicture.asset('assets/svg/iconsax-global-edit.svg'),
        8.width,
        Text(S.of(context).language, style: AppTextStyles.body2Bold),
        const Spacer(),
        Text(
          isArabic ? S.of(context).langArabic : S.of(context).langEnglish,
          style: AppTextStyles.body1Bold.copyWith(color: AppColors.dText),
        ),
        8.width,
        Icon(Icons.arrow_forward_ios, color: AppColors.dText),
      ],
    );
  }
}
