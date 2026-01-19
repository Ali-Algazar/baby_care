import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/check_box_widget.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAgreementRow extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const TermsAgreementRow({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckboxWidget(isCheck: isChecked, onClick: onChanged),
        8.width,
        Expanded(
          child: Text(
            S.of(context).termsAgreement,
            style: AppTextStyles.body2Ragular.copyWith(
              fontSize: 14.sp,
              color: AppColors.dText,
            ),
          ),
        ),
      ],
    );
  }
}
