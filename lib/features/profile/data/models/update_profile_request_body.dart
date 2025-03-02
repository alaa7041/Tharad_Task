import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'file_converter.dart';
part 'update_profile_request_body.g.dart';

@JsonSerializable()
class UpdateProfileRequestBody {
  final String username;
  final String email;
  final String password;

  @JsonKey(name: "new_password_confirmation")
  final String newPasswordConfirmation;

  @JsonKey(name: "new_password")
  final String newPassword;
   @JsonKey(name: "_method")
  final String method;

  @FileConverter()
  final File? image;

  UpdateProfileRequestBody({
    required this.username,
    required this.email,
    required this.password,
    required this.newPasswordConfirmation,
    required this.newPassword,
    required this.method,
    
    this.image,
  });

  factory UpdateProfileRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyToJson(this);
  Future<Map<String, dynamic>> toMultipartForm() async {
    return {
      "username": username,
      "email": email,
      "password": password,
      "new_password": newPassword,
      "new_password_confirmation": newPasswordConfirmation,
      "_method": "PUT",
      "image": image != null ? await MultipartFile.fromFile(image!.path) : null,
    };
  }
}
