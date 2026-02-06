import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/children/presentation/cubit/children_state.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticlesViewBody extends StatelessWidget {
  const ArticlesViewBody({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            24.height,
            BlocBuilder<ChildrenCubit, ChildrenState>(
              builder: (context, state) {
                if (state is ChildrenLoaded) {
                  return CustomHomeAppBar(child: state.children);
                }
                return SizedBox.shrink();
              },
            ),
            18.height,
            Padding(
              padding: Constants.khorizontalPadding.horizontal,
              child: Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      8.width,
                      Expanded(
                        child: Text(
                          articleModel.title,
                          style: AppTextStyles.headerBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  24.height,
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          articleModel.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  24.height,
                  Markdown(
                    data: articleModel.content,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    styleSheet: MarkdownStyleSheet(
                      p: AppTextStyles.captionRagular.copyWith(
                        color: AppColors.dText,
                        fontSize: 14,
                      ),
                      h1: AppTextStyles.headerRagular.copyWith(
                        color: AppColors.mText,
                      ),
                      h2: AppTextStyles.btnsBold,
                      strong: AppTextStyles.body2Bold.copyWith(
                        color: AppColors.middleColor,
                        fontSize: 14,
                      ),
                      listBullet: AppTextStyles.captionRagular.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Constants.kbottomPadding.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
