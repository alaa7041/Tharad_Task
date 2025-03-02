
import 'package:tharad_tech/core/networking/api_error_handler.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo( this.apiService);


  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {

    try{
     final response = await apiService.login(loginRequestBody);
     return ApiResult.success(response);
   }catch(e){
     return ApiResult.failure(ErrorHandler.handle(e));
   }
  }
}
