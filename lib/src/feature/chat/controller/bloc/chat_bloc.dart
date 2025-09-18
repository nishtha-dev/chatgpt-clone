import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/core/constants/constants.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/controller/controller.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/models/chat_data_model.dart';
import 'package:uuid/uuid.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  Uuid uuid = const Uuid();
  final ChatRepository chatRepo;
  ChatBloc({
    required this.chatRepo,
  }) : super(const ChatState()) {
    on<GetQueryResponse>(_getQueryResponse);
    on<UpdateTypeStatus>(_updateTypeStatus);
  }
  FutureOr<void> _getQueryResponse(
      GetQueryResponse event, Emitter<ChatState> emit) async {
    try {
      emit(
        state.copyWith(
          chatHistory: state.addToHistory(
              text: event.userQuery, uuid: uuid, userType: UserType.user),
        ),
      );
      String res = await chatRepo.getQueryResponse(userQuery: event.userQuery);
      emit(
        state.copyWith(
          chatHistory: state.addToHistory(
              text: res, uuid: uuid, userType: UserType.chatModel),
        ),
      );
    } on Exception catch (err) {
      // TODO: Handle error status
      print(err);
    }
  }

  FutureOr<void> _updateTypeStatus(
      UpdateTypeStatus event, Emitter<ChatState> emit) async {
    try {
      ChatDataModel currentChat =
          state.chatHistory.firstWhere((element) => element.id == event.chatId);
      currentChat.shouldType = false;
      emit(state.copyWith(chatHistory: state.chatHistory));
    } on Exception catch (err) {
      // TODO: Handle error status
      print(err);
    }
  }
}
