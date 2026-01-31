import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/auth/data/model/user_model.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChatEmptyState extends StatelessWidget {
  const ChatEmptyState({super.key});

  Future<UserModel> _getUser() async {
    return await HiveHelper.getData(
      boxName: Constants.userBox,
      key: Constants.userHiveKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: _getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(
              '${S.of(context).chatHello} ${snapshot.data!.name} 👋',
              style: AppTextStyles.headerBold,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
