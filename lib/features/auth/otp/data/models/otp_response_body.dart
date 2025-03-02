import 'package:json_annotation/json_annotation.dart';

part 'otp_response_body.g.dart';

@JsonSerializable()
class OtpResponse {
  final String message;
  final String status;

  OtpResponse({required this.message, required this.status});

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseToJson(this);
}
