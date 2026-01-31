import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/features/chat_bot/data/repositories/chat_bot_repository.dart';
import 'package:baby_care/features/chat_bot/presentation/cubit/get_answer/chat_bot_cubit.dart';
import 'package:baby_care/features/chat_bot/presentation/cubit/get_chat_history_cubit/get_chat_history_cubit.dart';
import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_bot_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/chat_bot_view_body.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key, this.messages = const [], this.keyRecord});
  static const String routeName = '/chatBot';

  final List messages;
  final String? keyRecord;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatBotCubit(sl<ChatBotRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              GetChatHistoryCubit(sl<ChatBotRepository>())..getChatHistory(),
        ),
      ],
      child: Scaffold(
        body: ChatBotViewBody(messages: messages, keyRecord: keyRecord),
        endDrawer: const ChatBotDrawer(),
      ),
    );
  }
}
