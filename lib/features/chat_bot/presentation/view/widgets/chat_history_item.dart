import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/chat_bot/presentation/cubit/get_chat_history_cubit/get_chat_history_cubit.dart';
import 'package:baby_care/features/chat_bot/presentation/view/chat_bot_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatHistoryItem extends StatelessWidget {
  const ChatHistoryItem({
    super.key,
    required this.chatRecord,
    required this.index,
  });

  final List chatRecord;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: WidgetLinearColor(
        widget: Text(chatRecord.first.tixt, style: AppTextStyles.body1Bold),
      ),
      onTap: () async {
        var keyRecord = await HiveHelper.getKeyAt(
          Constants.kChatHistoryBox,
          index,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatBotView(messages: chatRecord, keyRecord: keyRecord),
          ),
        );
      },
      trailing: IconButton(
        onPressed: () {
          context.read<GetChatHistoryCubit>().deleteChatRecord(index);
        },
        icon: Icon(Icons.delete, color: AppColors.danger),
      ),
    );
  }
}
