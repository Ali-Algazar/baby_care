import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/main_layout/presentation/cubit/navigation_cubit.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<NavigationCubit>(context).navigateTo(0);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        Spacer(),
        Text(S.of(context).accountTitle, style: AppTextStyles.headerBold),
        Spacer(),
      ],
    );
  }
}
