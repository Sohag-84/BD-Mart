part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class RegisterUser extends AuthEvent {
  final String name;
  final String emailOrPhone;
  final String password;
  final String confirmPassword;
  final String deviceToken;

  const RegisterUser({
    required this.name,
    required this.emailOrPhone,
    required this.password,
    required this.confirmPassword,
    required this.deviceToken,
  });

  @override
  List<Object> get props => [
        name,
        emailOrPhone,
        password,
        confirmPassword,
        deviceToken,
      ];
}

final class LoginUser extends AuthEvent {
  final String email;
  final String password;
  final String deviceToken;

  const LoginUser({
    required this.email,
    required this.password,
    required this.deviceToken,
  });

  @override
  List<Object> get props => [email, password, deviceToken];
}

final class SubmitOtp extends AuthEvent {
  final String userId;
  final String otp;

  const SubmitOtp({required this.userId, required this.otp});
  @override
  List<Object> get props => [userId, otp];
}

final class ForgetPasswordRequested extends AuthEvent {
  final String email;

  const ForgetPasswordRequested({required this.email});

  @override
  List<Object> get props => [email];
}
