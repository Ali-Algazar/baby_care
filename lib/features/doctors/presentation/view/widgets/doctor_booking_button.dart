import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorBookingButton extends StatelessWidget {
  const DoctorBookingButton({super.key, required this.doctorName});
  final String doctorName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openWhatsApp(
          phone: '201090786986',
          message: 'مرحبا، أرغب في حجز موعد مع $doctorName.',
        );
      },
      child: Container(
        width: double.infinity,
        height: 46.h,
        decoration: BoxDecoration(
          gradient: AppColors.primaryL,
          borderRadius: BorderRadius.circular(
            Constants.kbuttonRadius.toDouble(),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('إحجز عبر واتساب', style: AppTextStyles.btnsBold),
            8.width,
            SvgPicture.asset('assets/svg/WhatsApp.svg', height: 35),
          ],
        ),
      ),
    );
  }

  Future<void> openWhatsApp({
    required String phone,
    required String message,
  }) async {
    final encodedMessage = Uri.encodeComponent(message);

    final uri = Uri.parse('https://wa.me/$phone?text=$encodedMessage');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open WhatsApp';
    }
  }
}
