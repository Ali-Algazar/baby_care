import 'package:baby_care/features/home/presentation/view/home_view.dart';
import 'package:baby_care/features/main_layout/data/navbar_item_model.dart';
import 'package:baby_care/features/main_layout/presentation/cubit/navigation_cubit.dart';
import 'package:baby_care/features/main_layout/presentation/view/widgets/custom_nav_bar.dart';
import 'package:baby_care/features/profile/presentation/view/profile_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});
  static const routeName = '/main-layout';

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  late List<NavModel> navItems;
  final List<Widget> pages = [
    const HomeView(),
    const Scaffold(body: Center(child: Text('Tracking Page'))),
    const Scaffold(body: Center(child: Text('Services Page'))),
    const Scaffold(body: Center(child: Text('Community Page'))),
    ProfileView(),
  ];
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
    return BlocListener<NavigationCubit, int>(
      listener: (context, state) {
        print(state);
        setState(() {
          selectedIndex = 0;
        });
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: pages[selectedIndex]),
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
      ),
    );
  }
}
