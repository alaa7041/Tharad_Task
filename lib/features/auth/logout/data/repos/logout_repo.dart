import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../core/helpers/hive_helper.dart';
import '../../../../../core/networking/api_service.dart';


class LogoutRepo {
  final ApiService apiService;

  LogoutRepo( this.apiService);


  Future<void> logout() async {

    try {
      var box = await Hive.openBox('appBox');
      String? token = box.get('auth_token');

      if (token != null) {
        final response = await apiService.logout("Bearer $token");
        print(response.message);

        // Remove token after successful logout
        await HiveHelper.removeToken();
      } else {
        print("No token found!");
      }
    } catch (e) {
      print("Logout failed: $e");
    }
  }
  }
