import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/main_layout/data/navbar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<NavModel> navItems;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final double itemWidth =
        MediaQuery.of(context).size.width / navItems.length;
    Locale locale = Localizations.localeOf(context);

    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            top: 0,
            left: locale.languageCode == 'en'
                ? selectedIndex * itemWidth
                : null,
            right: locale.languageCode == 'ar'
                ? selectedIndex * itemWidth
                : null,
            width: itemWidth,
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/triangle.svg',
                width: 66,
                height: 28,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 10),

          Row(
            children: List.generate(navItems.length, (index) {
              return SizedBox(
                width: itemWidth,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    onTap(index);
                  },
                  child: _buildNavItem(index),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index) {
    bool isActive = index == selectedIndex;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 25),

        isActive
            ? WidgetLinearColor(
                widget: SvgPicture.asset(
                  navItems[index].assetName,
                  width: 24,
                  height: 24,
                ),
              )
            : SvgPicture.asset(
                navItems[index].assetName,
                width: 24,
                height: 24,
              ),

        const SizedBox(height: 4), // مسافة بين الأيقونة والنص
        // 3. النص (بيظهر ويختفي في مكانه بدون ما يأثر على اللي حواليه)
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isActive ? 1.0 : 0.0, // لو مش نشط بيبقى شفاف بس حاجز مكانه
          child: isActive
              ? WidgetLinearColor(
                  widget: Text(
                    navItems[index].title,
                    style: AppTextStyles.captionLight.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                )
              : Text(
                  navItems[index].title,
                  style: AppTextStyles.captionLight.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
        ),
      ],
    );
  }
}
