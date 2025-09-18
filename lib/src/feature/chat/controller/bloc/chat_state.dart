part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<ChatDataModel> chatHistory;
  const ChatState({
    this.chatHistory = const [],
  });

  ChatState copyWith({List<ChatDataModel>? chatHistory}) {
    return ChatState(
      chatHistory: chatHistory ?? this.chatHistory,
    );
  }

  @override
  List<Object> get props => [chatHistory];
}

extension ChatStateX on ChatState {
  List<ChatDataModel> addToHistory({
    required String text,
    required Uuid uuid,
    required UserType userType,
  }) {
    return [
      ...chatHistory,
      ChatDataModel(
        shouldType: userType.isUser ? false : true,
        chatText: text,
        id: uuid.v1(),
        userType: userType,
      ),
    ];
  }

  void updateStatus(
    String id,
  ) {
    ChatDataModel currentChat =
        chatHistory.firstWhere((element) => element.id == id);
    currentChat.shouldType = false;
  }
}
