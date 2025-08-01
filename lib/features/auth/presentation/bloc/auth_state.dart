part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

//login
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure({required this.error});
  @override
  List<Object> get props => [error];
}

//signup
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final String message;
  final String emailOrPhone;
  final String userId;

  const RegisterSuccess({
    required this.message,
    required this.emailOrPhone,
    required this.userId,
  });
  @override
  List<Object> get props => [message, emailOrPhone, userId];
}

class RegisterFailure extends AuthState {
  final String error;

  const RegisterFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class AuthOtpSent extends AuthState {
  final String message;
  final String userId;
  final String emailOrPhone;

  const AuthOtpSent({
    required this.message,
    required this.userId,
    required this.emailOrPhone,
  });

  @override
  List<Object> get props => [message, userId, emailOrPhone];
}
