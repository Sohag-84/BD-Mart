part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

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

class AuthOtpSent extends AuthState {
  final String userId;

  const AuthOtpSent({required this.userId});

  @override
  List<Object> get props => [userId];
}
