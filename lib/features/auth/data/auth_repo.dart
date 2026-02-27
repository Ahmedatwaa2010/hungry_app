import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_erorr.dart';
import 'package:hungry_app/core/network/api_exception.dart';
import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/core/utils/pref_helpers.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';

class AuthRepo {
  ApiService apiService = ApiService();

  Future<UserModel?> login(String email, String pass) async {
    try {
      final response = await apiService.post("/login", {
        "email": email,
        "password": pass,
      });
      final user = UserModel.fromJson(response["data"]);
      if (user.token != null) {
        await PrefHelpers.saveUserToken(user.token!);
      }

      return user;
    } on DioError catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }
}

/// sign up


/// profile

/// logout 

