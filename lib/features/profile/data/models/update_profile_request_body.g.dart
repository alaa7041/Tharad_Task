// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestBody _$UpdateProfileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequestBody(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      newPasswordConfirmation: json['new_password_confirmation'] as String,
      newPassword: json['new_password'] as String,
      method: json['_method'] as String,
      image: const FileConverter().fromJson(json['image'] as String?),
    );

Map<String, dynamic> _$UpdateProfileRequestBodyToJson(
        UpdateProfileRequestBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'new_password_confirmation': instance.newPasswordConfirmation,
      'new_password': instance.newPassword,
      '_method': instance.method,
      'image': const FileConverter().toJson(instance.image),
    };
