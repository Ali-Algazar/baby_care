import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChatBotRepository {
  Future<Either<Failure, String>> getChatBotResponse({
    required String userMessage,
  });
  Future<Either<Failure, List>> getChatHistory();
  Future<Either<Failure, void>> cacheChatInHistory(
    List<ChatBotModel> chatHistory,
  );
  Future<Either<Failure, List>> deleteChatRecord(int index);
  Future<Either<Failure, List>> upDataChatHistory({
    required String key,
    required List<ChatBotModel> chatHistory,
  });
}
