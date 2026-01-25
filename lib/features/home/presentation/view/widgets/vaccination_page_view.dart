import 'package:baby_care/features/home/presentation/view/widgets/vaccination_card.dart';
import 'package:flutter/material.dart';

class VaccinationPageView extends StatelessWidget {
  const VaccinationPageView({
    super.key,
    required PageController controller,
    required this.onPageChanged,
  }) : _controller = controller;

  final PageController _controller;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: PageView.builder(
        padEnds: false,
        controller: _controller,
        itemCount: 3,

        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: VaccinationCard(),
          );
        },
      ),
    );
  }
}
