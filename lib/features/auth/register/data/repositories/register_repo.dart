

import 'package:dio/dio.dart';
import 'package:tharad_tech/core/networking/api_service.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/register_request_body.dart';
import '../models/register_response.dart';

class RegisterRepo{

  final ApiService apiService;

  RegisterRepo(this.apiService);


  Future<ApiResult<RegisterResponse>> register(Map<String, dynamic> formData) async {
    try{
      final response = await apiService.register(FormData.fromMap(formData));
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}