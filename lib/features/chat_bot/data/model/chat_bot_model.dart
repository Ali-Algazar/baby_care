import 'package:hive/hive.dart';
part 'chat_bot_model.g.dart';

@HiveType(typeId: 6)
class ChatBotModel {
  @HiveField(0)
  final String tixt;
  @HiveField(1)
  final bool isAnswer;
  ChatBotModel({required this.tixt, required this.isAnswer});
}
