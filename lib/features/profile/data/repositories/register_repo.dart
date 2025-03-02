

import 'package:dio/dio.dart';
import 'package:tharad_tech/core/networking/api_service.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/update_profile_response.dart';

class UpdateProfileRepo{

  final ApiService apiService;

  UpdateProfileRepo(this.apiService);


  Future<ApiResult<UpdateProfileResponse>> profileUpdate(Map<String, dynamic> formData) async {
    try{
      final response = await apiService.profilUpdate(FormData.fromMap(formData));
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}