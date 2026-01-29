import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class ArticlesCareWidget extends StatelessWidget {
  const ArticlesCareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        margin: const EdgeInsets.only(right: 16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.bG,
          border: Border.all(color: AppColors.bG1),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withValues(alpha: 0.04),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: Color(0xFF000000).withValues(alpha: 0.04),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Text(
                      'كيف تساعدين طفلك على تطوير مهاراته الاجتماعية؟',
                      style: AppTextStyles.body2Bold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    8.height,
                    Text(
                      'تلعب المهارات الاجتماعية دورًا حيويًا في نمو الطفل وتطوره. إليك بعض النصائح لمساعدته على تطوير هذه المهارات المهمة.',
                      style: AppTextStyles.captionRagular.copyWith(
                        color: Color(0xff8C8C8C),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    8.height,
                    WidgetLinearColor(
                      widget: Row(
                        children: [
                          Text(
                            S.of(context).viewArticle,
                            style: AppTextStyles.body2Bold.copyWith(),
                          ),
                          2.width,
                          Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: context.width * 0.3,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                color: Colors.grey,
                image: const DecorationImage(
                  image: AssetImage('assets/image/onboarding_image1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
