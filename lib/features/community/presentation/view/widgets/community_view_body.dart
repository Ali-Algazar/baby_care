import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/community/presentation/view/widgets/my_posts_view.dart';
import 'package:baby_care/features/community/presentation/view/widgets/post_card_widget.dart';
import 'package:baby_care/features/services/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: Constants.khorizontalPadding.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Constants.ktopPadding.height,

                  Row(
                    children: [
                      const CircleAvatar(radius: 20),
                      8.width,
                      Text(
                        'يوسف احمد ',
                        style: AppTextStyles.btnsBold.copyWith(
                          color: AppColors.mText,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyPostsView(),
                            ),
                          );
                        },
                        child: WidgetLinearColor(
                          widget: Text(
                            'عرض منشوراتى',
                            style: AppTextStyles.body1Bold.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  18.height,

                  // --- Page Title ---
                  Center(
                    child: Text('المجتمع', style: AppTextStyles.headerBold),
                  ),
                  18.height,

                  // --- Search ---
                  const SearchTextField(),
                  32.height,

                  // --- Section Title ---
                  Text('جميع المنشورات', style: AppTextStyles.headerBold),
                  24.height,
                ],
              ),
            ),
          ),

          // --- Posts List ---
          SliverList.builder(
            itemCount: 10, // Mock count
            itemBuilder: (context, index) => PostCardWidget(
              hasImage: index == 1, // Example: 2nd post has image
              isMyPost: false,
            ),
          ),
        ],
      ),
    );
  }
}
