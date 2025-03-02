import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tharad_tech/features/auth/login/data/models/login_request_body.dart';
import 'package:tharad_tech/features/profile/data/models/update_profile_response.dart';
import '../../features/auth/login/data/models/login_response.dart';
import '../../features/auth/logout/data/models/logout_response.dart';
import '../../features/auth/otp/data/models/otp_response_body.dart';
import '../../features/auth/register/data/models/register_response.dart';
import 'api_constants.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.register)
  @MultiPart()
  Future<RegisterResponse> register(
    @Body() FormData formData,
  );
  @GET(ApiConstants.otp)
  Future<OtpResponse> verifyOtp(
    @Query("email") String email,
    @Query("otp") int otp,
  );

  @POST(ApiConstants.profileupdate)
  @MultiPart()
  Future<UpdateProfileResponse> profilUpdate(
    @Body() FormData formData,
  );
  
  @DELETE(ApiConstants.logout)
  Future<LogoutResponse> logout(@Header("Authorization") String token);
}
