import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/widgets/circle_avatar_linear_color.dart';
import 'package:baby_care/features/community/presentation/view/widgets/add_post_view.dart';
import 'package:baby_care/features/community/presentation/view/widgets/community_view_body.dart';
import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});
  static const String routeName = '/community';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CommunityViewBody(),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPostView()),
          );
        },
        icon: const CircleAvatarLinearColor(
          radius: 28,
          child: Icon(Icons.add, color: AppColors.bG, size: 40),
        ),
      ),
    );
  }
}
