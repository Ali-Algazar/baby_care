import 'package:baby_care/core/services/api_helper.dart';
import 'package:baby_care/core/utils/end_points.dart';
import 'package:dio/dio.dart';

abstract class ChatBotRemoteDataSource {
  Future<Response> fetchChatBotResponse({required String userMessage});
}

class ChatBotRemoteDataSourceImpl implements ChatBotRemoteDataSource {
  final ApiHelper apiHelper;
  ChatBotRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<Response> fetchChatBotResponse({required String userMessage}) async {
    var response = await apiHelper.get(
      '${ApiEndpoints.chatbotSearch}?q=$userMessage',
    );
    return response;
  }
}
