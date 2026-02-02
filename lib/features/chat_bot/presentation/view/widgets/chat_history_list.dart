import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/chat_bot/presentation/cubit/get_chat_history_cubit/get_chat_history_cubit.dart';
import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatHistoryList extends StatelessWidget {
  const ChatHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetChatHistoryCubit, GetChatHistoryState>(
      builder: (context, state) {
        if (state is GetChatHistoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetChatHistoryLoaded) {
          return ListView.builder(
            itemCount: state.chatHistory.length,
            itemBuilder: (context, index) {
              return ChatHistoryItem(
                chatRecord: state.chatHistory[index],
                index: index,
              );
            },
          );
        }

        if (state is GetChatHistoryError) {
          return Center(
            child: Text(state.message, style: AppTextStyles.body2Bold),
          );
        }
        if (state is GetChatHistoryEmpty) {
          return Center(
            child: Text(
              'No chat history available.',
              style: AppTextStyles.body2Bold,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
