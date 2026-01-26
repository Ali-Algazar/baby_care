import 'package:baby_care/core/cubit/cubit/locale_cubit.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LanguageSettingRow extends StatefulWidget {
  const LanguageSettingRow({super.key});

  @override
  State<LanguageSettingRow> createState() => _LanguageSettingRowState();
}

class _LanguageSettingRowState extends State<LanguageSettingRow> {
  @override
  Widget build(BuildContext context) {
    bool isArabic = context.watch<LocaleCubit>().state == 'ar';

    return InkWell(
      onTap: () {
        showLanguageSettings(context, isArabic);
      },
      child: Row(
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
      ),
    );
  }

  Future<dynamic> showLanguageSettings(BuildContext context, bool isArabic) {
    return showModalBottomSheet(
      context: context,

      builder: (context) {
        return Container(
          height: 148,
          width: double.infinity,
          padding: 16.all,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.close, color: AppColors.dText),
                  ),
                  8.width,
                  Text(
                    S.of(context).language,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.mText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              9.height,
              Row(
                children: [
                  LangCheckBox(
                    isAtav: isArabic,
                    onTab: () {
                      if (!isArabic) {
                        setState(() {
                          isArabic = true;
                        });
                        BlocProvider.of<LocaleCubit>(
                          context,
                        ).changeLocale('ar');
                      }
                    },
                  ),
                  8.width,
                  Text(
                    S.of(context).langArabic,
                    style: AppTextStyles.btnsRagular,
                  ),
                ],
              ),
              8.height,
              Row(
                children: [
                  LangCheckBox(
                    isAtav: !isArabic,
                    onTab: () {
                      if (isArabic) {
                        setState(() {
                          isArabic = false;
                        });
                        BlocProvider.of<LocaleCubit>(
                          context,
                        ).changeLocale('en');
                      }
                    },
                  ),
                  8.width,
                  Text(
                    S.of(context).langEnglish,
                    style: AppTextStyles.btnsRagular,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class LangCheckBox extends StatelessWidget {
  const LangCheckBox({super.key, required this.isAtav, required this.onTab});
  final bool isAtav;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 21,
        height: 21,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isAtav ? AppColors.success : AppColors.dText,
            width: 2,
          ),
        ),
        child: Center(
          child: isAtav
              ? CircleAvatar(radius: 7, backgroundColor: AppColors.success)
              : null,
        ),
      ),
    );
  }
}
