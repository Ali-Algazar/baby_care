import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/auth/data/model/user_model.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Future<UserModel> fitchedUser() async {
    var user = await HiveHelper.getData(
      boxName: Constants.userBox,
      key: Constants.userHiveKey,
    );
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fitchedUser(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (asyncSnapshot.hasError) {
          return Center(child: Text('Error: ${asyncSnapshot.error}'));
        }
        if (asyncSnapshot.hasData) {
          UserModel user = asyncSnapshot.data!;
          return Column(
            children: [
              Constants.ktopPadding.height,
              CustomHomeAppBar(user: user),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
