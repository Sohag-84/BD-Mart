import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/entity/response_entity.dart';
import 'package:gym_swat/features/auth/domain/usecases/forget_password_confirm_usecase.dart';
import 'package:gym_swat/features/auth/domain/usecases/forget_password_request_usecase.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordRequestUsecase requestUsecase;
  final ForgetPasswordConfirmUsecase confirmUsecase;

  ForgetPasswordBloc({
    required this.requestUsecase,
    required this.confirmUsecase,
  }) : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) {});

    on<ForgetPasswordRequestEvent>(_forgetPasswordRequestEvent);

    on<ForgetPasswordConfirmEvent>(_forgetPasswordConfirmEvent);
  }

  Future<void> _forgetPasswordRequestEvent(
    ForgetPasswordRequestEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(ForgetPasswordRequestLoading());

    final result = await requestUsecase.call(ForgetPassReqParams(
      emailOrPhone: event.emailOrPhone,
      sendCodeBy: event.sendCodeBy,
    ));

    result.fold(
      (error) => emit(ForgetPasswordRequestFailure(error: error.message)),
      (data) {
        emit(ForgetPasswordRequest(responseResult: data));
      },
    );
  }

  Future<void> _forgetPasswordConfirmEvent(
    ForgetPasswordConfirmEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(ForgetPasswordConfirmLoading());

    final result = await confirmUsecase.call(ForgetPassConfirmParams(
      verificationCode: event.verificationCode,
      newPassword: event.newPassword,
    ));

    result.fold(
      (error) => emit(ForgetPasswordConfirmFailure(error: error.message)),
      (data) => emit(ForgetPasswordConfirm(responseResult: data)),
    );
  }
}
