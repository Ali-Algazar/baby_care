abstract class ChatBotState {}

class ChatBotInitial extends ChatBotState {}

class ChatBotLoading extends ChatBotState {}

class ChatBotLoaded extends ChatBotState {
  final String answer;

  ChatBotLoaded(this.answer);
}

class ChatBotError extends ChatBotState {
  final String message;

  ChatBotError(this.message);
}
