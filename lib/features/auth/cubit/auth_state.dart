part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final bool isSuccsed;
  final String? error;
  AuthState({this.isLoading = false, this.isSuccsed = false, this.error});
  AuthState copyWith({bool? isLoading, bool? isSuccess, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isSuccsed: isSuccess ?? this.isSuccsed,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccsed, error];
}
