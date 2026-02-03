import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/home/presentation/view/widgets/articles_care_widget.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogViewBody extends StatelessWidget {
  const BlogViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم CustomScrollView عادي جداً
    // الـ NestedScrollView سيتعرف عليه تلقائياً بفضل الـ PrimaryScrollController
    return CustomScrollView(
      // key: PageStorageKey('blog_view'), // اختياري: لحفظ مكان السكرول عند التنقل بين التابات
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text(
                  S.of(context).allArticles,
                  style: AppTextStyles.headerBold,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: SvgPicture.asset('assets/svg/leading.svg'),
                ),
              ],
            ),
          ),
        ),

        // قائمة المقالات
        SliverList.builder(
          itemCount: 15, // مثال
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            child: ArticlesCareWidget(),
          ),
        ),

        // مسافة أمان في الأسفل
        const SliverToBoxAdapter(child: SizedBox(height: 80)),
      ],
    );
  }
}
