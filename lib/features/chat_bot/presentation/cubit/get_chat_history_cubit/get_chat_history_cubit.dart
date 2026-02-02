import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';
import 'package:baby_care/features/chat_bot/data/repositories/chat_bot_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_chat_history_state.dart';

class GetChatHistoryCubit extends Cubit<GetChatHistoryState> {
  GetChatHistoryCubit(this.chatBotRepository) : super(GetChatHistoryInitial());
  final ChatBotRepository chatBotRepository;

  Future<void> getChatHistory() async {
    emit(GetChatHistoryLoading());
    final chatHistory = await chatBotRepository.getChatHistory();
    chatHistory.fold(
      (l) {
        emit(GetChatHistoryError(message: l.message));
      },
      (r) {
        if (r.isEmpty) {
          emit(GetChatHistoryEmpty());
        } else {
          emit(GetChatHistoryLoaded(chatHistory: r));
        }
      },
    );
  }

  Future<void> deleteChatRecord(int index) async {
    emit(GetChatHistoryLoading());
    final chatHistory = await chatBotRepository.deleteChatRecord(index);
    chatHistory.fold(
      (l) {
        emit(GetChatHistoryError(message: l.message));
      },
      (r) {
        if (r.isEmpty) {
          emit(GetChatHistoryEmpty());
        } else {
          emit(GetChatHistoryLoaded(chatHistory: r));
        }
      },
    );
  }

  Future<void> cacheChatHistory(List<ChatBotModel> chatHistory) async {
    emit(GetChatHistoryLoading());
    final chatHist = await chatBotRepository.cacheChatInHistory(chatHistory);
    chatHist.fold((l) {
      emit(GetChatHistoryError(message: l.message));
    }, (r) => null);
  }

  Future<void> upDataChatHistory({
    required String key,
    required List<ChatBotModel> chatHistory,
  }) async {
    emit(GetChatHistoryLoading());
    final chatHist = await chatBotRepository.upDataChatHistory(
      key: key,
      chatHistory: chatHistory,
    );
    chatHist.fold((l) {
      emit(GetChatHistoryError(message: l.message));
    }, (r) => emit(GetChatHistoryLoaded(chatHistory: r)));
  }
}
