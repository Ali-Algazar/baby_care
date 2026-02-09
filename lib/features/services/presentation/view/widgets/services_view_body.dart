import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/empty_home_app_bar.dart';
import 'package:baby_care/features/blog/presentation/view/blog_view.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/children/presentation/cubit/children_state.dart';
import 'package:baby_care/features/doctors/presentation/view/doctors_view.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:baby_care/features/medicine/presentation/view/medicine_view.dart';
import 'package:baby_care/features/services/presentation/view/widgets/search_text_field.dart';
import 'package:baby_care/features/services/presentation/view/widgets/services_tab_bar.dart';
import 'package:baby_care/features/services/presentation/view/widgets/sliver_tab_bar_delegate.dart';
import 'package:baby_care/features/sounds/presentation/view/sounds_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesViewBody extends StatefulWidget {
  const ServicesViewBody({super.key});
  static int initialTabIndex = 0;

  @override
  State<ServicesViewBody> createState() => _ServicesViewBodyState();
}

class _ServicesViewBodyState extends State<ServicesViewBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isDoctorsSelected = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: ServicesViewBody.initialTabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Constants.ktopPadding.height,
                  BlocBuilder<ChildrenCubit, ChildrenState>(
                    builder: (context, state) {
                      if (state is ChildrenLoaded) {
                        return CustomHomeAppBar(child: state.children);
                      }
                      if (state is ChildrenEmpty) {
                        return EmptyHomeAppBar();
                      }
                      return SizedBox();
                    },
                  ),
                  24.height,
                  Padding(
                    padding: Constants.khorizontalPadding.horizontal,
                    child: isDoctorsSelected
                        ? SearchDoctorTextField()
                        : SearchTextField(),
                  ),
                  24.height,
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverTabBarDelegate(
                ServicesTabBar(
                  tabController: tabController,
                  onTap: (value) {
                    if (value == 1) {
                      setState(() {
                        isDoctorsSelected = true;
                      });
                    } else {
                      if (isDoctorsSelected) {
                        setState(() {
                          isDoctorsSelected = false;
                        });
                      }
                    }
                  },
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [SoundsView(), DoctorsView(), MedicineView(), BlogView()],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    ServicesViewBody.initialTabIndex = tabController.index;
    tabController.dispose();
  }
}
