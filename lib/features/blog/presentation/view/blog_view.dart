import 'package:flutter/material.dart';
import 'widgets/blog_view_body.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BlogViewBody());
  }
}
