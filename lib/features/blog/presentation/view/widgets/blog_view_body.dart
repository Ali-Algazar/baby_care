import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/blog/presentation/cubit/blog_cubit.dart';
import 'package:baby_care/features/blog/presentation/cubit/blog_state.dart';
import 'package:baby_care/features/home/presentation/view/widgets/articles_care_widget.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogViewBody extends StatelessWidget {
  const BlogViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BlogError) {
          return Center(child: Text(state.message));
        }
        if (state is BlogLoaded) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).allArticles,
                        style: AppTextStyles.headerBold,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: SvgPicture.asset('assets/svg/leading.svg'),
                      ),
                    ],
                  ),
                ),
              ),

              SliverList.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: ArticlesCareWidget(
                    articleModel: state.articles[index],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          );
        }
        if (state is BlogEmpty) {
          return Center(
            child: Text(
              ' S.of(context).noArticlesAvailable',
              style: AppTextStyles.headerBold,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
