import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

class LoginUserData {
  String email = "";
  String passWord = "";
}

class SignUpUserData extends LoginUserData {
  String name = "";
}

@JsonSerializable(
  includeIfNull: false,
)
class UserDataModel {
  final String name;
  final String emailId;

  const UserDataModel({
    this.name = '',
    this.emailId = '',
  });
  UserDataModel copyWith({
    String? name,
    String? emailId,
  }) {
    return UserDataModel(
      name: name ?? this.name,
      emailId: emailId ?? this.emailId,
    );
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
