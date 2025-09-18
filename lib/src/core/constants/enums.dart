enum UserType { user, chatModel }

extension UserTypeX on UserType {
  bool get isUser => this == UserType.user;
  bool get isChatModel => this == UserType.chatModel;
}
