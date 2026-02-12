// lib/features/community/presentation/view/my_posts_view.dart

import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_appbar.dart'; // Assuming you have one
import 'package:baby_care/features/community/presentation/view/widgets/post_card_widget.dart';
import 'package:flutter/material.dart';

class MyPostsView extends StatelessWidget {
  const MyPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyPostsViewBody());
  }
}

class MyPostsViewBody extends StatelessWidget {
  const MyPostsViewBody({super.key});

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
                  // Custom App Bar (Or Manual Row)
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      const Spacer(),
                      Text('منشوراتى', style: AppTextStyles.headerBold),
                      const Spacer(),
                    ],
                  ),
                  32.height,
                  Text('جميع منشوراتي', style: AppTextStyles.headerBold),
                  24.height,
                ],
              ),
            ),
          ),

          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const PostCardWidget(
              hasImage: false,
              isMyPost: true, // This enables the dots menu
            ),
          ),
        ],
      ),
    );
  }
}
