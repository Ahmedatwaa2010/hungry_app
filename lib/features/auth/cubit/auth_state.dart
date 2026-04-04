part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String token;
  AuthSuccess({required this.token});
  @override
  List<Object?> get props => [token];
}

class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
  @override
  List<Object?> get props => [error];
}
