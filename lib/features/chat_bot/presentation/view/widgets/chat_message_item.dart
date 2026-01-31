import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';
import 'package:flutter/material.dart';

class ChatMessageItem extends StatelessWidget {
  const ChatMessageItem({super.key, required this.message});
  final ChatBotModel message;

  @override
  Widget build(BuildContext context) {
    if (message.isAnswer) {
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(38),
          ),
          child: Text(message.tixt, style: AppTextStyles.body1Bold),
        ),
      );
    }

    return Text(message.tixt, style: AppTextStyles.body1Bold);
  }
}
