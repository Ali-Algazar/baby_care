import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/auth/data/model/user_model.dart';
import 'package:flutter/material.dart';

class ProfileUserName extends StatelessWidget {
  const ProfileUserName({super.key});
  Future<UserModel> getUserName() async {
    var user = await HiveHelper.getData(
      boxName: Constants.userBox,
      key: Constants.userHiveKey,
    );
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final user = snapshot.data!;
          return Text(user.name, style: AppTextStyles.textStyle20);
        } else {
          return const Text('No user data available');
        }
      },
    );
  }
}
