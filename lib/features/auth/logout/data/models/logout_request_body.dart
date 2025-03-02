
import 'package:json_annotation/json_annotation.dart';
part 'logout_request_body.g.dart';

@JsonSerializable()

class LogoutRequestBody {
  

  LogoutRequestBody(
      );

  Map<String, dynamic> toJson() => _$LogoutRequestBodyToJson(this);
}
