import 'package:freezed_annotation/freezed_annotation.dart';
part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  String? message;
  @JsonKey(name: 'data')
  dynamic userData;
  String? status;

  LogoutResponse({
    this.message,
    this.userData,
    this.status,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
}
