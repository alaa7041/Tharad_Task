import 'package:tharad_tech/core/networking/api_error_handler.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/otp_response_body.dart';

class OtpRepo {
  final ApiService apiService;

  OtpRepo(this.apiService);
  

  Future<ApiResult<OtpResponse>> verifyOtp(String email, int otp) async {
    try{
     final response = await apiService.verifyOtp(email, otp);
     return ApiResult.success(response);
   }catch(e){
     return ApiResult.failure(ErrorHandler.handle(e));
   }
  }
}