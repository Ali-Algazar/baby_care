import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/check_box_widget.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeRow extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final VoidCallback onForgotPassword;

  const RememberMeRow({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckboxWidget(isCheck: isChecked, onClick: onChanged),
        8.width,
        Text(
          S.of(context).rememberMe,
          style: AppTextStyles.body2Ragular.copyWith(
            fontSize: 14.sp,
            color: AppColors.dText,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onForgotPassword,
          child: WidgetLinearColor(
            widget: Text(
              S.of(context).forgotPassword,
              style: AppTextStyles.body2Ragular,
            ),
          ),
        ),
      ],
    );
  }
}
