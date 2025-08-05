part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordRequestEvent extends ForgetPasswordEvent {
  final String emailOrPhone;
  final String sendCodeBy;

  const ForgetPasswordRequestEvent({
    required this.emailOrPhone,
    required this.sendCodeBy,
  });

  @override
  List<Object> get props => [emailOrPhone, sendCodeBy];
}

final class ForgetPasswordConfirmEvent extends ForgetPasswordEvent {
  final String verificationCode;
  final String newPassword;
  const ForgetPasswordConfirmEvent({
    required this.verificationCode,
    required this.newPassword,
  });

  @override
  List<Object> get props => [verificationCode, newPassword];
}
