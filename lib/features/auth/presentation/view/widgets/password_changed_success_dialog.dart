import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/main_layout/presentation/view/main_layout_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class PasswordChangedSuccessDialog extends StatelessWidget {
  const PasswordChangedSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetLinearColor(widget: const CircleAvatar(radius: 35)),
            const SizedBox(height: 16),
            Text(
              S.of(context).passwordChangedSuccess,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CustomButton(
              title: S.of(context).backToHome,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainLayoutView.routeName,
                  (_) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
