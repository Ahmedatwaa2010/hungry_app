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
        final coder = int.tryParse(code?.toString() ?? '');
        final data = response['data'];
        if ((coder != 200 && coder != 201) || data == null) {
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

  Future<UserModel?> signup(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    try {
      final response = await apiService.post("/register", {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      });

      if (response is ApiErorr) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final coder = int.tryParse(code?.toString() ?? '');
        final data = response['data'];
        if ((coder != 200 && coder != 201 && coder != 202) || data == null) {
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
