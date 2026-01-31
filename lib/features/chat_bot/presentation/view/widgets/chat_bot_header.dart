import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';
import 'package:baby_care/features/chat_bot/presentation/cubit/get_chat_history_cubit/get_chat_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChatBotHeader extends StatelessWidget {
  const ChatBotHeader({
    super.key,
    required this.messages,
    required this.keyRecord,
  });

  final List<ChatBotModel> messages;
  final String? keyRecord;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            final cubit = context.read<GetChatHistoryCubit>();

            if (messages.isNotEmpty && keyRecord == null) {
              await cubit.cacheChatHistory(messages);
            } else if (messages.isNotEmpty && keyRecord != null) {
              await cubit.upDataChatHistory(
                key: keyRecord!,
                chatHistory: messages,
              );
            }

            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        const Spacer(),
        InkWell(
          onTap: () => Scaffold.of(context).openEndDrawer(),
          child: SvgPicture.asset('assets/svg/menu-03.svg'),
        ),
      ],
    );
  }
}
