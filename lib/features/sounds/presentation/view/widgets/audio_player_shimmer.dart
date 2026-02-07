import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AudioPlayerShimmer extends StatelessWidget {
  const AudioPlayerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            // صورة الصوت الدائرية
            const CircleAvatar(radius: 25, backgroundColor: Colors.white),
            const SizedBox(width: 24),

            // منطقة النص والـ Slider
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // هيكل العنوان
                  Container(
                    width: 120,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // هيكل الـ Slider مع أرقام الوقت
                  Row(
                    children: [
                      Container(width: 25, height: 8, color: Colors.white),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(width: 25, height: 8, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),

            // هيكل زر الـ Play
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
