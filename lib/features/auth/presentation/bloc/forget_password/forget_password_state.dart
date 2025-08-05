part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordRequestLoading extends ForgetPasswordState {}

final class ForgetPasswordRequest extends ForgetPasswordState {
  final ResponseEntity responseResult;
  const ForgetPasswordRequest({required this.responseResult});
}

final class ForgetPasswordRequestFailure extends ForgetPasswordState {
  final String error;
  const ForgetPasswordRequestFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class ForgetPasswordConfirmLoading extends ForgetPasswordState {}

final class ForgetPasswordConfirm extends ForgetPasswordState {
  final ResponseEntity responseResult;
  const ForgetPasswordConfirm({required this.responseResult});
}

final class ForgetPasswordConfirmFailure extends ForgetPasswordState {
  final String error;
  const ForgetPasswordConfirmFailure({required this.error});

  @override
  List<Object> get props => [error];
}
