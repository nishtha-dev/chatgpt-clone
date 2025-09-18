// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetQueryResponse extends ChatEvent {
  final String userQuery;
  const GetQueryResponse({
    required this.userQuery,
  });
}

class UpdateTypeStatus extends ChatEvent {
  final String chatId;
  const UpdateTypeStatus({
    required this.chatId,
  });
}
