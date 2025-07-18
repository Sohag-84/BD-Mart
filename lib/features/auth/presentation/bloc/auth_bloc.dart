import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/features/auth/domain/usecases/user_login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUsecase userLoginUsecase;

  AuthBloc({required this.userLoginUsecase}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<LoginUser>(_loginUser);
  }

  Future<void> _loginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    if (event.email.isEmpty) {
      Fluttertoast.showToast(msg: "Email can't be empty");
      return;
    }
    if (event.password.isEmpty) {
      Fluttertoast.showToast(msg: "Password can't be empty");
      return;
    }

    final result = await userLoginUsecase.call(
      UserLoginParams(
        email: event.email,
        password: event.password,
        deviceToken: event.deviceToken,
      ),
    );
    result.fold(
      (error) => emit(
        AuthFailure(error: error.message),
      ),
      (user) {
        if (user.result == true) {
          emit(AuthSuccess(message: user.message ?? "Login Successfull"));
          LocalPreferenceService.instance
              .setToken(token: user.accessToken ?? "");
        } else if (user.message == "Please verify your account") {
          emit(AuthOtpSent(userId: user.userId.toString()));
        } else {
          emit(AuthFailure(error: user.message ?? "Login Failed"));
        }
      },
    );
  }
}
