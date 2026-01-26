import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DarkModeSettingRow extends StatelessWidget {
  const DarkModeSettingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/moon.svg'),
        8.width,
        Text(S.of(context).darkMode, style: AppTextStyles.body2Bold),
        Spacer(),
        Switch(
          value: false,
          onChanged: (value) {},
          activeThumbColor: Colors.white,

          activeTrackColor: Colors.green,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey.shade400,
        ),
      ],
    );
  }
}
