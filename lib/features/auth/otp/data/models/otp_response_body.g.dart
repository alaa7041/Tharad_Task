// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResponse _$OtpResponseFromJson(Map<String, dynamic> json) => OtpResponse(
      message: json['message'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$OtpResponseToJson(OtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
