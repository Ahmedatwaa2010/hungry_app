import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry_app/core/network/api_erorr.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
  AuthRepo authRepo = AuthRepo();

  Future<void> login(String email, String pass) async {
    emit(state.copyWith(isLoading: true, isSuccess: false));
    try {
      final user = await authRepo.login(email, pass);
      if (user != null) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(isLoading: false, error: "Login failed"));
      }
    } catch (e) {
      String message = "Unhandled error in login";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(state.copyWith(isLoading: false, error: message, isSuccess: false));
    }
  }

  Future<void> signup(
    String name,
    String email,
    String pass,
    String phone,
  ) async {
    emit(state.copyWith(isLoading: true, isSuccess: false));
    try {
      final user = await authRepo.signup(name, email, pass, phone);
      if (user != null) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            error: "Signup failed",
            isSuccess: false,
          ),
        );
      }
    } catch (e) {
      String message = "Unhandled error in signup";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(state.copyWith(isLoading: false, error: message, isSuccess: false));
    }
  }
}
