import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  String? status;

  RegisterResponse({
    this.message,
    this.userData,
    this.status,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? email;
  String? image;
  String? userName;
  int? otp;
  @JsonKey(name: 'username')
  UserData({this.email, this.image, this.otp, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
