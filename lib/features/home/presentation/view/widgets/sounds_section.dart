import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/home/presentation/view/widgets/sleep_sounds_card_grid_view.dart';
import 'package:baby_care/features/main_layout/presentation/cubit/navigation_cubit.dart';
import 'package:baby_care/features/services/presentation/view/widgets/services_view_body.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoundsSection extends StatelessWidget {
  const SoundsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.khorizontalPadding.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              Text(S.of(context).sleepSounds, style: AppTextStyles.headerBold),
              const Spacer(),
              InkWell(
                onTap: () {
                  ServicesViewBody.initialTabIndex = 0;
                  context.read<NavigationCubit>().changeIndex(2);
                },
                child: WidgetLinearColor(
                  widget: Text(
                    S.of(context).viewAll,
                    style: AppTextStyles.body1Bold,
                  ),
                ),
              ),
            ],
          ),
          16.height,
          SizedBox(child: SleepSoundsCardGridView()),
        ],
      ),
    );
  }
}
