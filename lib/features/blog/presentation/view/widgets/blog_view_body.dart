import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/header_tap.dart';
import 'package:baby_care/features/blog/presentation/view/widgets/blog_view_bloc_builder.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class BlogViewBody extends StatelessWidget {
  const BlogViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: HeaderTap(title: S.of(context).allArticles),
          ),
        ),
        SliverToBoxAdapter(child: 24.height),
        BlogViewBlocBuilder(),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }
}
