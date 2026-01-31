import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_history_list.dart';
import 'package:flutter/material.dart';

class ChatBotDrawer extends StatelessWidget {
  const ChatBotDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      child: const ChatHistoryList(),
    );
  }
}
