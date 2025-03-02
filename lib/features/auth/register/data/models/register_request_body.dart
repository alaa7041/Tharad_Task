import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'file_converter.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String username;
  final String email;
  final String password;

  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;

  @FileConverter()
  final File? image;

  RegisterRequestBody({
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.image,
  });

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
  Future<Map<String, dynamic>> toMultipartForm() async {
    return {
      "username": username,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "image": image != null ? await MultipartFile.fromFile(image!.path) : null,
    };
  }
}
