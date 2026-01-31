import 'package:baby_care/features/chat_bot/data/repositories/chat_bot_repository.dart';
import 'package:baby_care/features/chat_bot/presentation/cubit/get_answer/chat_bot_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit(this.chatBotRepository) : super(ChatBotInitial());
  final ChatBotRepository chatBotRepository;
  Future<void> getanswer(String userMessage) async {
    emit(ChatBotLoading());
    final answer = await chatBotRepository.getChatBotResponse(
      userMessage: userMessage,
    );
    answer.fold(
      (l) {
        emit(ChatBotError(l.message));
      },
      (r) {
        emit(ChatBotLoaded(r));
      },
    );
  }
}
