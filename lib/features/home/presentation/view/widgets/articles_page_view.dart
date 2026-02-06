import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:baby_care/features/blog/presentation/cubit/blog_cubit.dart';
import 'package:baby_care/features/blog/presentation/cubit/blog_state.dart';
import 'package:baby_care/features/home/presentation/view/widgets/articles_care_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesPageView extends StatelessWidget {
  const ArticlesPageView({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        print('BlogState: $state');
        if (state is BlogLoaded) {
          return SizedBox(
            height: 190,
            child: PageView.builder(
              padEnds: false,
              controller: controller,
              itemCount: state.articles.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: ArticlesCareWidget(
                    articleModel: state.articles[index],
                  ),
                );
              },
            ),
          );
        }
        if (state is BlogLoading) {
          return SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 300,
                      height: 190,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          );
        }
        if (state is BlogError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        return SizedBox(
          height: 190,
          child: Center(
            child: Text(
              'No articles available',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
