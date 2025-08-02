import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/auth/domain/usecases/otp_submit_usecase.dart';
import 'package:gym_swat/features/auth/domain/usecases/otp_resend_usecase.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpSubmitUsecase otpSubmitUsecase;
  final OtpResendUsecase otpResendUsecase;

  OtpBloc({
    required this.otpSubmitUsecase,
    required this.otpResendUsecase,
  }) : super(OtpInitial()) {
    on<OtpEvent>((event, emit) {});

    on<OtpSubmit>(_otpSubmit);
    on<OtpResend>(_otpResend);
  }

  Future<void> _otpSubmit(OtpSubmit event, Emitter<OtpState> emit) async {
    emit(OtpSubmitLoading());

    final result = await otpSubmitUsecase.call(
      OtpSubmitParams(
        userId: event.userId,
        otpCode: event.otpCode,
      ),
    );

    result.fold(
      (error) => emit(OtpSubmitFailure(error: error.message)),
      (data) {
        if (data.result == true) {
          emit(OtpSubmitSuccess(message: data.message ?? "Otp Submitted"));
        } else {
          emit(
            OtpSubmitFailure(error: data.message ?? "Something went wrong!"),
          );
        }
      },
    );
  }

  Future<void> _otpResend(OtpResend event, Emitter<OtpState> emit) async {
    emit(OtpResendLoading());

    final result = await otpResendUsecase.call(
      OtpResendParams(
        userId: event.userId,
        registerBy: event.registerBy,
      ),
    );

    result.fold(
      (error) => emit(OtpResendFailure(error: error.message)),
      (data) => emit(OtpResendSuccess(message: data)),
    );
  }
}
