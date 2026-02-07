import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NointernetconnectionView extends StatelessWidget {
  const NointernetconnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            40.height,
            SvgPicture.asset('assets/svg/no-wifi.svg', height: 100),
            16.height,
            Text(
              S.of(context).noInternetConnection,
              style: AppTextStyles.headerBold,
            ),
          ],
        ),
      ),
    );
  }
}
