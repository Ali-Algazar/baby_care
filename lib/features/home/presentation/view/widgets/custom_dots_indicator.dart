import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: currentIndex.toDouble(),

      decorator: DotsDecorator(
        color: Color(0xffA0A1A5),
        activeColor: Color(0xff54afa5),
      ),
    );
  }
}
