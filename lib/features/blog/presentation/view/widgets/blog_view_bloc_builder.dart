import 'package:baby_care/core/widgets/empty_view.dart';
import 'package:baby_care/core/widgets/no_internet_connection_view.dart';
import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:baby_care/features/blog/presentation/cubit/blog_cubit.dart';
import 'package:baby_care/features/blog/presentation/cubit/blog_state.dart';
import 'package:baby_care/features/blog/presentation/view/widgets/blog_loaded_view.dart';
import 'package:baby_care/features/blog/presentation/view/widgets/blog_loading_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogViewBlocBuilder extends StatelessWidget {
  const BlogViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return BlogLoadingView();
        } else if (state is BlogError) {
          if (state.message == 'No internet connection') {
            return NointernetconnectionView();
          }
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        if (state is BlogLoaded) {
          return BlogLoadedView(articles: state.articles as List<ArticleModel>);
        }
        if (state is BlogEmpty) {
          return EmptyView(message: S.of(context).noArticlesAvailable);
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
