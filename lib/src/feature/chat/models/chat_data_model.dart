import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/constants/constants.dart';

part 'chat_data_model.g.dart';

@JsonSerializable(includeIfNull: false, createToJson: false)
class ChatDataModel {
  bool shouldType;
  final String chatText;
  final String id;
  final UserType userType;
  ChatDataModel({
    this.shouldType = true,
    required this.chatText,
    required this.id,
    required this.userType,
  });
  ChatDataModel copyWith({
    bool? shouldType,
    String? chatText,
    String? id,
    UserType? userType,
  }) {
    return ChatDataModel(
      shouldType: shouldType ?? this.shouldType,
      chatText: chatText ?? this.chatText,
      id: id ?? this.id,
      userType: userType ?? this.userType,
    );
  }

  factory ChatDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChatDataModelFromJson(json);
}

extension ChatDataModelX on ChatDataModel {
  set updateTypeStatus(bool status) {
    shouldType = status;
  }
}
