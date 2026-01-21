import 'package:baby_care/features/main_layout/data/navbar_item_model.dart';
import 'package:baby_care/features/main_layout/presentation/view/widgets/custom_nav_bar.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});
  static const routeName = '/main-layout';

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  late List<NavModel> navItems;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    navItems = [
      NavModel(
        title: S.of(context).navHome,
        assetName: 'assets/svg/home-icon.svg',
      ),
      NavModel(
        title: S.of(context).navTracking,
        assetName: 'assets/svg/nav_tracking.svg',
      ),
      NavModel(
        title: S.of(context).navServices,
        assetName: 'assets/svg/nav_servicessvg.svg',
      ),
      NavModel(
        title: S.of(context).navCommunity,
        assetName: 'assets/svg/nav_community.svg',
      ),
      NavModel(
        title: S.of(context).navAccount,
        assetName: 'assets/svg/nav_account.svg',
      ),
    ];
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: SizedBox()),
          CustomNavBar(
            navItems: navItems,
            selectedIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
