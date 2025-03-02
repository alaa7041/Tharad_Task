import 'package:freezed_annotation/freezed_annotation.dart';
part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse {
  String? message;
  dynamic data;
  String? status;

  OtpResponse({
    this.message,
    this.data,
    this.status,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);
}
