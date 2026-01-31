import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/chat_bot/data/datasources/chat_bot_local_data_source.dart';
import 'package:baby_care/features/chat_bot/data/datasources/chat_bot_remote_data_source.dart';

import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';

import 'package:dartz/dartz.dart';

import 'chat_bot_repository.dart';

class ChatBotRepositoryImpl implements ChatBotRepository {
  final ChatBotLocalDataSource localDataSource;
  final ChatBotRemoteDataSource remoteDataSource;
  ChatBotRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, String>> getChatBotResponse({
    required String userMessage,
  }) async {
    try {
      var respons = await remoteDataSource.fetchChatBotResponse(
        userMessage: userMessage,
      );
      if (respons.statusCode == 200) {
        return right(respons.data['answer']);
      } else {
        return left(ServerFailure(''));
      }
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List>> getChatHistory() async {
    try {
      final list = await localDataSource.getChatHistory();
      return right(list);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheChatInHistory(
    List<ChatBotModel> chatHistory,
  ) async {
    try {
      await localDataSource.cacheChatHistory(chatHistory);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteChatRecord(int index) async {
    try {
      await localDataSource.deleteChatHistory(index: index);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List>> upDataChatHistory({
    required String key,
    required List<ChatBotModel> chatHistory,
  }) async {
    try {
      await localDataSource.upDataChatHistory(
        key: key,
        chatHistory: chatHistory,
      );
      var list = await localDataSource.getChatHistory();
      return right(list);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
