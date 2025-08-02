part of 'otp_bloc.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitial extends OtpState {}

final class OtpSubmitLoading extends OtpState {}

final class OtpSubmitSuccess extends OtpState {
  final String message;
  const OtpSubmitSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class OtpSubmitFailure extends OtpState {
  final String error;
  const OtpSubmitFailure({required this.error});

  @override
  List<Object> get props => [error];
}

///for otp resend state
final class OtpResendLoading extends OtpState {}

final class OtpResendSuccess extends OtpState {
  final String message;
  const OtpResendSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class OtpResendFailure extends OtpState {
  final String error;
  const OtpResendFailure({required this.error});

  @override
  List<Object> get props => [error];
}
