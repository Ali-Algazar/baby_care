import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/community/presentation/view/widgets/post_replays_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PostCardWidget extends StatefulWidget {
  final bool hasImage;
  final bool isMyPost;

  const PostCardWidget({
    super.key,
    required this.hasImage,
    this.isMyPost = false,
  });

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  // حالة التفاعل (مؤقتة للـ UI)
  bool isLike = false;
  bool isDislike = false;
  bool isSaved = false;
  int likeCount = 134;
  int dislikeCount = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.khorizontalPadding.all,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: AppColors.bG1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Header (User Info) ---
          Row(
            children: [
              const CircleAvatar(radius: 20),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'يوسف احمد ',
                    style: AppTextStyles.btnsBold.copyWith(
                      color: AppColors.mText,
                    ),
                  ),
                  Text('.  منذ ٦ أشهر', style: AppTextStyles.captionRagular),
                ],
              ),
              const Spacer(),
              if (widget.isMyPost)
                SvgPicture.asset('assets/svg/dots-horizontal.svg'),
            ],
          ),
          16.height,

          InkWell(
            onTap: () {
              // الانتقال لتفاصيل المنشور/الردود
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostReplaysView(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الاستيقاظ الليلي يزداد سوءًا في عمر ٩ أشهر - هل هذا طبيعي؟',
                  style: AppTextStyles.body2Bold,
                ),
                8.height,
                Text(
                  'كانت ابنتي تنام طوال الليل من عمر ٦-٨ أشهر، ولكن الآن في عمر ٩ أشهر تستيقظ ٣-٤ مرات كل ليلة. هل واجه أحد منكم هذا التراجع؟ أبحث عن نصيحة...',
                  style: AppTextStyles.captionRagular,
                ),
                if (widget.hasImage)
                  Container(
                    width: double.infinity,
                    height: 229.h,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.graphic),
                      // color: Colors.grey[200], // Placeholder color
                    ),
                  ),
              ],
            ),
          ),
          16.height,

          // --- Footer (Actions) ---
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Changed to spaceBetween for better layout
            children: [
              // Like
              _buildInteractionButton(
                iconPath: 'assets/svg/like.svg',
                count: likeCount,
                isActive: isLike,
                onTap: () {
                  setState(() {
                    if (isLike) {
                      likeCount--;
                    } else {
                      likeCount++;
                      if (isDislike) {
                        isDislike = false;
                        dislikeCount--;
                      }
                    }
                    isLike = !isLike;
                  });
                },
              ),

              // Dislike
              _buildInteractionButton(
                iconPath: 'assets/svg/dislike.svg',
                count: dislikeCount,
                isActive: isDislike,
                onTap: () {
                  setState(() {
                    if (isDislike) {
                      dislikeCount--;
                    } else {
                      dislikeCount++;
                      if (isLike) {
                        isLike = false;
                        likeCount--;
                      }
                    }
                    isDislike = !isDislike;
                  });
                },
              ),

              // Comments
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostReplaysView(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/message.svg'),
                    8.width,
                    Text('12', style: AppTextStyles.captionRagular),
                  ],
                ),
              ),

              // Views
              Row(
                children: [
                  SvgPicture.asset('assets/svg/eye.svg', height: 16),
                  8.width,
                  Text('١٤٢', style: AppTextStyles.captionRagular),
                ],
              ),

              // Save
              InkWell(
                onTap: () => setState(() => isSaved = !isSaved),
                child: isSaved
                    ? WidgetLinearColor(
                        widget: SvgPicture.asset('assets/svg/seve.svg'),
                      )
                    : SvgPicture.asset('assets/svg/seve.svg'),
              ),

              // Share (Shirt icon?) -> Assuming Share based on icon usage usually
              SvgPicture.asset('assets/svg/shirt.svg'),
            ],
          ),
        ],
      ),
    );
  }

  // Helper widget for Like/Dislike buttons to reduce code duplication
  Widget _buildInteractionButton({
    required String iconPath,
    required int count,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: AnimatedCrossFade(
        firstChild: Row(
          children: [
            SvgPicture.asset(iconPath),
            8.width,
            Text('$count', style: AppTextStyles.captionRagular),
          ],
        ),
        secondChild: WidgetLinearColor(
          widget: Row(
            children: [
              SvgPicture.asset(iconPath),
              8.width,
              Text('$count', style: AppTextStyles.captionRagular),
            ],
          ),
        ),
        crossFadeState: isActive
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}
