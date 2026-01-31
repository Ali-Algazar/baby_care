part of 'get_chat_history_cubit.dart';

@immutable
sealed class GetChatHistoryState {}

final class GetChatHistoryInitial extends GetChatHistoryState {}

final class GetChatHistoryLoading extends GetChatHistoryState {}

final class GetChatHistoryLoaded extends GetChatHistoryState {
  final List chatHistory;
  GetChatHistoryLoaded({required this.chatHistory});
}

final class GetChatHistoryError extends GetChatHistoryState {
  final String message;
  GetChatHistoryError({required this.message});
}

final class GetChatHistoryEmpty extends GetChatHistoryState {}

final class GetChatHistoryDeleted extends GetChatHistoryState {}
