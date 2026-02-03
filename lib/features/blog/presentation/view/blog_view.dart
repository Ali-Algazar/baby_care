import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/features/blog/data/repositories/blog_repository.dart';
import 'package:baby_care/features/blog/presentation/cubit/blog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/blog_view_body.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogCubit(sl<BlogRepository>())..fetchBlogArticles(),
      child: const Scaffold(body: BlogViewBody()),
    );
  }
}
