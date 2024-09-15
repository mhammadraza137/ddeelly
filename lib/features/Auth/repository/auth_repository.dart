import 'dart:developer';

import 'package:ddeelly/core/networkService/api_client.dart';
import 'package:ddeelly/core/networkService/api_response.dart';
import 'package:ddeelly/core/networkService/internet_connection.dart';
import 'package:ddeelly/utils/constants/api_url.dart';
import 'package:ddeelly/utils/constants/app_strings.dart';

class AuthRepository {


  Future<ApiResponse> signInUser({required String email, required String password}) async{
    try{
      ApiClient apiClient = ApiClient.instance;
      await apiClient.post(ApiUrl.login,
          {
        "email": email,
        "password": password,
        "device_id": "dcndjc89"
      }
      );
      return ApiResponse(
        status: Status.success,
      );
    } catch(err){
      return ApiResponse(status: Status.failure, message: AppStrings.somethingWentWrong);
    }
  }
}
