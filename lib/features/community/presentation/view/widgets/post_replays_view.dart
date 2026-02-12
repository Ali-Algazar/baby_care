// lib/features/community/presentation/view/post_replays_view.dart

import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_appbar.dart';
import 'package:baby_care/features/community/presentation/view/widgets/post_card_widget.dart';
import 'package:baby_care/features/community/presentation/view/widgets/reply_card_widget.dart';
import 'package:flutter/material.dart';

class PostReplaysView extends StatelessWidget {
  const PostReplaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PostReplaysViewBody());
  }
}

class PostReplaysViewBody extends StatelessWidget {
  const PostReplaysViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Constants.ktopPadding.height,
                      Padding(
                        padding: Constants.khorizontalPadding.horizontal,
                        child: CustomAppBar(
                          title: 'التعليقات',
                          onBack: () => Navigator.pop(context),
                        ),
                      ),
                      24.height,
                      // The Original Post
                      const PostCardWidget(hasImage: false, isMyPost: false),
                      24.height,
                      Padding(
                        padding: Constants.khorizontalPadding.horizontal,
                        child: Text('الردود', style: AppTextStyles.headerBold),
                      ),
                      16.height,
                    ],
                  ),
                ),

                // List of Replies
                SliverList.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => const ReplyCardWidget(),
                ),
                SliverToBoxAdapter(child: Constants.kbottomPadding.height),
              ],
            ),
          ),

          // --- Comment Input Field ---
          Container(
            padding: 16.all,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.border)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'أكتب تعليقاً...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: AppColors.border),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
