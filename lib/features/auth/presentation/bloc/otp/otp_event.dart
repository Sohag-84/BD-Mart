part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

final class OtpSubmit extends OtpEvent {
  final String userId;
  final String otpCode;

  const OtpSubmit({
    required this.userId,
    required this.otpCode,
  });

  @override
  List<Object> get props => [userId, otpCode];
}

final class OtpResend extends OtpEvent {
  final String userId;
  final String registerBy;

  const OtpResend({
    required this.userId,
    required this.registerBy,
  });

  @override
  List<Object> get props => [userId, registerBy];
}
