import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/custom_appbar.dart';
import 'package:baby_care/features/vaccination/presentation/view/widgets/vaccination_tab_bar.dart';
import 'package:baby_care/features/vaccination/presentation/view/widgets/vaccination_tab_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class VaccinationViewBody extends StatefulWidget {
  const VaccinationViewBody({super.key});

  @override
  State<VaccinationViewBody> createState() => _VaccinationViewBodyState();
}

class _VaccinationViewBodyState extends State<VaccinationViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        animationDuration: Duration(milliseconds: 300),
        child: Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Column(
            children: [
              Constants.ktopPadding.height,
              CustomAppBar(
                title: S.of(context).vaccinations,
                onBack: () {
                  Navigator.pop(context);
                },
              ),
              25.height,
              VaccinationTabBar(tabController: _tabController),
              VaccinationTabView(tabController: _tabController),
            ],
          ),
        ),
      ),
    );
  }
}
