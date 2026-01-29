import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/home/presentation/view/widgets/articles_page_view.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_dots_indicator.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({
    super.key,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
  });
  final PageController controller;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Row(
            children: [
              Text(S.of(context).articles, style: AppTextStyles.headerBold),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: WidgetLinearColor(
                  widget: Text(
                    S.of(context).viewAll,
                    style: AppTextStyles.body1Bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        16.height,
        ArticlesPageView(controller: controller, onPageChanged: onPageChanged),
        10.height,
        CustomDotsIndicator(currentIndex: currentIndex),
      ],
    );
  }
}
