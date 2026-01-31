import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';
import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_message_item.dart';
import 'package:flutter/material.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({super.key, required this.messages});
  final List<ChatBotModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: ChatMessageItem(message: messages[index]),
      ),
    );
  }
}
