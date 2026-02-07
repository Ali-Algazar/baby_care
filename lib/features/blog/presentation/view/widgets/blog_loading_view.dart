import 'package:baby_care/features/blog/presentation/view/widgets/article_card_shimmer.dart';
import 'package:flutter/material.dart';

class BlogLoadingView extends StatelessWidget {
  const BlogLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 6,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: const ArticleCardShimmer(),
      ),
    );
  }
}
