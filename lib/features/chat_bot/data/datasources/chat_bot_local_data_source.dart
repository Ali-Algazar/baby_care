import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/chat_bot/data/model/chat_bot_model.dart';

abstract class ChatBotLocalDataSource {
  Future<List> getChatHistory();
  Future<void> cacheChatHistory(List<ChatBotModel> chatHistory);
  Future<void> deleteChatHistory({required int index});
  Future<void> upDataChatHistory({
    required String key,
    required List<ChatBotModel> chatHistory,
  });
}

class ChatBotLocalDataSourceImpl implements ChatBotLocalDataSource {
  @override
  Future<List> getChatHistory() async {
    var data = await HiveHelper.getAllValues(Constants.kChatHistoryBox);
    print(data);
    if (data.isEmpty) {
      List list = [];
      return list;
    }

    return data;
  }

  @override
  Future<void> cacheChatHistory(List<ChatBotModel> chatHistory) async {
    await HiveHelper.putData(
      boxName: Constants.kChatHistoryBox,
      key: DateTime.now().toString(),
      value: chatHistory,
    );
  }

  @override
  Future<void> deleteChatHistory({required int index}) async {
    await HiveHelper.deletAt(Constants.kChatHistoryBox, index);
  }

  @override
  Future<void> upDataChatHistory({
    required String key,
    required List<ChatBotModel> chatHistory,
  }) async {
    await HiveHelper.putData(
      boxName: Constants.kChatHistoryBox,
      key: key,
      value: chatHistory,
    );
  }
}
