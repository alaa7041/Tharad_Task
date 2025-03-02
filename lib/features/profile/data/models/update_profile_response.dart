import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
part 'update_profile_response.g.dart';

@JsonSerializable()
class UpdateProfileResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  String? status;

  UpdateProfileResponse({
    this.message,
    this.userData,
    this.status,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
}

@JsonSerializable()
class UserData {
   String? email;
  String? image;
  int? id;
  
  @JsonKey(name: 'username') 
  String? userName;

  String? imageUrl;
  @JsonKey(name: 'username')
  UserData({this.email, this.image, this.id, this.userName, this.imageUrl});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
