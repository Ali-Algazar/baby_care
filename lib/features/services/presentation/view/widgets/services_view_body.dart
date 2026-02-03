import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/blog/presentation/view/blog_view.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/children/presentation/cubit/children_state.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:baby_care/features/services/presentation/view/widgets/search_text_field.dart';
import 'package:baby_care/features/services/presentation/view/widgets/services_tab_bar.dart';
import 'package:baby_care/features/services/presentation/view/widgets/sliver_tab_bar_delegate.dart';
import 'package:baby_care/generated/l10n.dart';
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    BlocBuilder<ChildrenCubit, ChildrenState>(
                      builder: (context, state) {
                        if (state is ChildrenLoaded) {
                          return CustomHomeAppBar(child: state.children);
                        }
                        return SizedBox();
                      },
                    ),
                    24.height,
                    SearchTextField(),
                    24.height,
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverTabBarDelegate(
                ServicesTabBar(tabController: tabController),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            Center(child: Text(S.of(context).sounds)),
            Center(child: Text(S.of(context).doctors)),
            Center(child: Text(S.of(context).medicines)),
            BlogView(),
          ],
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
