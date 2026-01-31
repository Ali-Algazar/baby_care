import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';
import 'package:baby_care/features/chat_bot/presentation/cubit/get_answer/chat_bot_cubit.dart';
import 'package:baby_care/features/chat_bot/presentation/cubit/get_answer/chat_bot_state.dart';
import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_bot_header.dart';
import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_bot_input_field.dart';
import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_empty_state.dart';
import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_messages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key, required this.messages, this.keyRecord});
  final List messages;
  final String? keyRecord;

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  List<ChatBotModel> messages = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    messages = List.from(widget.messages);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBotCubit, ChatBotState>(
      listener: _chatListener,
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Column(
            children: [
              Constants.ktopPadding.height,
              ChatBotHeader(messages: messages, keyRecord: widget.keyRecord),
              38.height,

              Expanded(
                child: messages.isEmpty
                    ? const ChatEmptyState()
                    : ChatMessagesList(messages: messages),
              ),

              ChatBotInputField(
                onSend: (value) {
                  setState(() {
                    messages.add(ChatBotModel(tixt: value, isAnswer: true));
                  });
                  context.read<ChatBotCubit>().getanswer(value);
                },
              ),
              16.height,
            ],
          ),
        ),
      ),
    );
  }

  void _chatListener(BuildContext context, ChatBotState state) {
    if (state is ChatBotLoading) {
      setState(() => isLoading = true);
    } else if (state is ChatBotLoaded) {
      messages.add(ChatBotModel(tixt: state.answer, isAnswer: false));
      setState(() => isLoading = false);
    } else if (state is ChatBotError) {
      setState(() => isLoading = false);
      context.showSnack(state.message);
    }
  }
}
