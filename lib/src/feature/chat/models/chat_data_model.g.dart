// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatDataModel _$ChatDataModelFromJson(Map<String, dynamic> json) =>
    ChatDataModel(
      shouldType: json['shouldType'] as bool? ?? true,
      chatText: json['chatText'] as String,
      id: json['id'] as String,
      userType: json['userType'] as UserType,
    );
