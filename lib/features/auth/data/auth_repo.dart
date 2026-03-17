import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_erorr.dart';
import 'package:hungry_app/core/network/api_exception.dart';
import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/core/utils/pref_helpers.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';

class AuthRepo {
  ApiService apiService = ApiService();
  bool isGuest = false;
  UserModel? _currentUser;
  // login
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
        /// error
        final msg = response['message'];
        final code = response['code'];
        final coder = int.tryParse(code?.toString() ?? '');
        final data = response['data'];
        if ((coder != 200 && coder != 201) || data == null) {
          throw ApiErorr(message: msg);
        } else {
          /// SUCCESS
          final user = UserModel.fromJson(response["data"]);
          if (user.token != null) {
            await PrefHelpers.saveUserToken(user.token!);
          }
          isGuest = false;
          _currentUser = user;
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

  // sign up
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
          isGuest = false;
          _currentUser = user;
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

  // get user profile data
  Future<UserModel?> getProfileData() async {
    try {
      final token = await PrefHelpers.getToken();
      if (token == null || token.isEmpty || token == "guest") {
        return null;
      }

      final response = await apiService.get("/profile");
      _currentUser = UserModel.fromJson(response["data"]);
      return _currentUser;
    } on DioError catch (erorr) {
      throw ApiExceptions.handleError(erorr);
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  ///update profile
  Future<UserModel?> updateProfileData({
    required String name,
    required String email,
    required String address,
    String? visa,
    String? imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'address': address,
        if (visa != null && visa.isNotEmpty) 'Visa': visa,
        if (imagePath != null && imagePath.isNotEmpty)
          'image': await MultipartFile.fromFile(
            imagePath,
            filename: 'profile.jpg',
          ),
      });
      final response = await apiService.post('/update-profile', formData);
      if (response is ApiErorr) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];
        final coder = int.tryParse(code?.toString() ?? '');

        if (coder != 200 && coder != 201) {
          throw ApiErorr(message: msg ?? 'Unknown error');
        }

        final updatedUser = UserModel.fromJson(data);
        _currentUser = updatedUser;
        return updatedUser;
      } else {
        throw ApiErorr(message: 'Invalid  Error from here');
      }
    } on DioError catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  /// logout
  Future<void> logout() async {
    try {
      await PrefHelpers.clearToken();
      isGuest = true;
      _currentUser = null;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  /// Auto login
  Future<UserModel?> autoLogin() async {
    try {
      final token = await PrefHelpers.getToken();
      if (token == null || token.isEmpty || token == "guest") {
        return null;
      }
      try {
        isGuest = false;
        final user = await getProfileData();
        _currentUser = user;
        return user;
      } catch (e) {
        await logout();
        return null;
      }
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  /// guest login
  Future<void> guestLogin() async {
    try {
      isGuest = true;
      _currentUser = null;
      await PrefHelpers.saveUserToken("guest");
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  UserModel? get currentUser => _currentUser;
  bool get isLogin => !isGuest && _currentUser != null;
}
