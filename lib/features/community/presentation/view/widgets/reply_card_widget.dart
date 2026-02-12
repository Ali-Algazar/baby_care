import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReplyCardWidget extends StatelessWidget {
  const ReplyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.all,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 18),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('محمد حامد', style: AppTextStyles.body1Bold),
                  WidgetLinearColor(
                    widget: Text(
                      'رد على المنشور',
                      style: AppTextStyles.captionRagular,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text('.  منذ ٦ أشهر', style: AppTextStyles.captionRagular),
            ],
          ),
          8.height,
          Padding(
            padding: 16.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'كانت ابنتي تنام طوال الليل من عمر ٦-٨ أشهر، ولكن الآن في عمر ٩ أشهر تستيقظ ٣-٤ مرات كل ليلة...',
                  style: AppTextStyles.captionRagular,
                ),
                16.height,
                // Interaction Row (Like/Dislike only for reply usually)
                Row(
                  children: [
                    _buildIconCount('assets/svg/like.svg', '775'),
                    16.width,
                    _buildIconCount('assets/svg/dislike.svg', '1'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconCount(String icon, String count) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 16),
        4.width,
        Text(count, style: AppTextStyles.captionRagular),
      ],
    );
  }
}
