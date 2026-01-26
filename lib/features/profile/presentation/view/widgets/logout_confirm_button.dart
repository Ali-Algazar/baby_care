import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:baby_care/features/auth/presentation/view/sign_in_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutConfirmButton extends StatelessWidget {
  const LogoutConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await BlocProvider.of<AuthCubit>(context).logout();
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(SignInView.routeName, (route) => false);
      },
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.danger,
        ),
        child: Center(
          child: Text(
            S.of(context).yes,
            style: AppTextStyles.body2Bold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
