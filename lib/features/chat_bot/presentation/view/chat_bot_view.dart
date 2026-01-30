import 'package:flutter/material.dart';
import 'widgets/chat_bot_view_body.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});
  static const String routeName = '/chatBot';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ChatBotViewBody());
  }
}
