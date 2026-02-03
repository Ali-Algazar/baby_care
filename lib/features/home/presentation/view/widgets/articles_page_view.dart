import 'package:baby_care/features/blog/data/model/article_model.dart';
import 'package:baby_care/features/home/presentation/view/widgets/articles_care_widget.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      height: 190,
      child: PageView.builder(
        padEnds: false,
        controller: controller,
        itemCount: 3,

        onPageChanged: onPageChanged,

        itemBuilder: (context, index) {
          return ArticlesCareWidget(
            articleModel: ArticleModel.fromJson({
              "_id": "6981d4d5362a779d8f6747d5",
              "title": "علامات نقص الحديد عند الأطفال",
              "content":
                  "# 🩸 علامات نقص الحديد عند الأطفال\n\nنقص الحديد يؤثر على النشاط والطاقة والتركيز عند الأطفال.\n\n## العلامات\n- شحوب الوجه.\n- تعب سريع وضعف العضلات.\n- تأخر النمو أو التهيج المستمر.\n\n## نصائح للأم\n- تقديم أطعمة غنية بالحديد مثل اللحوم الحمراء والعدس.\n- دمج الحديد مع فيتامين سي لزيادة الامتصاص.\n- استشارة الطبيب لتحديد مكملات الحديد إذا لزم الأمر.",
              "category": "general-tips",
              "imageUrl":
                  "https://images.ctfassets.net/o8idjrpb16rn/5GNaGxg2Jjek7XQ1ckDjAm/45d0f0de2d4224e51d6b670834bd9868/When_do_babies_start_crawling.png",
              "author": {
                "_id": "69468a8e9457e3d8fe6747ac",
                "name": "وزارة الصحة المصرية",
              },
              "createdAt": "2026-02-03T10:58:29.950Z",
              "updatedAt": "2026-02-03T10:58:29.950Z",
              "__v": 0,
            }),
          );
        },
      ),
    );
  }
}
