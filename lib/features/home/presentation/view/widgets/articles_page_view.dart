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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: ArticlesCareWidget(
              articleModel: ArticleModel.fromJson({
                "_id": "698230a2cc4f2ff4ac1605d5",
                "title": "دليل التعامل مع ارتفاع حرارة الطفل بعد التطعيم",
                "description":
                    "تعرفي على الخطوات الصحيحة والآمنة لخفض حرارة طفلك بعد تلقي التطعيمات الروتينية ومتى يجب استشارة الطبيب.",
                "content":
                    "# التعامل مع سخونة التطعيم\n\nتعتبر الحمى (ارتفاع درجة الحرارة) من الأعراض الجانبية الشائعة جداً بعد التطعيم، وهي دليل على أن **جهاز المناعة** يعمل بفعالية.\n\n### 🌡️ خطوات العناية بالمنزل:\n\n1. **الكمادات:** استخدمي كمادات ماء فاتر (وليس بارد جداً) على مكان الحقنة وعلى جبهة الطفل.\n2. **الملابس:** خففي ملابس الطفل لقطعة قطنية واحدة للسماح للحرارة بالخروج.\n3. **السوائل:** أكثري من الرضاعة (طبيعية أو صناعية) لمنع الجفاف.\n4. **خافض الحرارة:** يمكن استخدام الباراسيتامول (مثل سيتال أو بانادول) بالجرعة التي حددها الطبيب.\n\n### ⚠️ متى تتصلين بالطبيب؟\n* إذا استمرت الحرارة لأكثر من **48 ساعة**.\n* إذا تجاوزت الحرارة **39 درجة مئوية**.\n* إذا ظهرت تشنجات أو طفح جلدي غريب.",
                "category": "post-vaccination",
                "imageUrl":
                    "https://images.unsplash.com/photo-1519689680058-324335c77eba?w=800&q=80",
                "author": {
                  "_id": "69468a8e9457e3d8fe6747ac",
                  "name": "وزارة الصحة المصرية",
                },
                "createdAt": "2026-02-03T17:30:10.317Z",
                "updatedAt": "2026-02-03T17:30:10.317Z",
                "__v": 0,
              }),
            ),
          );
        },
      ),
    );
  }
}
