import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_erorr.dart';
import 'package:hungry_app/core/network/api_exception.dart';
import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/core/utils/pref_helpers.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';

class AuthRepo {
  ApiService apiService = ApiService();

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post("/login", {
        "email": email,
        "password": password,
      });

      if (response is ApiErorr) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];
        if (code != 200 || data == null) {
          throw ApiErorr(message: msg);
        } else {
          final user = UserModel.fromJson(response["data"]);
          if (user.token != null) {
            await PrefHelpers.saveUserToken(user.token!);
          }
          return user;
        }
      } else {
        throw ApiErorr(message: "Something went wrong from server");
      }
    } on DioError catch (erorr) {
      throw ApiExceptions.handleError(erorr);
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }
}

/// sign up


/// profile

/// logout 

