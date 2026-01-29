import 'package:baby_care/features/home/presentation/view/widgets/community_care_widget.dart';
import 'package:flutter/material.dart';

class CommunityPageView extends StatelessWidget {
  const CommunityPageView({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        padEnds: false,
        controller: controller,
        itemCount: 3,

        onPageChanged: onPageChanged,

        itemBuilder: (context, index) {
          return CommunityCareWidget();
        },
      ),
    );
  }
}
