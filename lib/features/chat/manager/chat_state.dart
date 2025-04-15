import '../data/models/chat_message_model.dart';

class ChatState {
  final List<ChatMessageModel> messages;
  final bool isLoading;

  ChatState({required this.messages, required this.isLoading});

  factory ChatState.initial() => ChatState(messages: [], isLoading: false);

  ChatState copyWith({List<ChatMessageModel>? messages, bool? isLoading}) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
