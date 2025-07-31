import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:gym_swat/features/auth/domain/usecases/user_signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignupUsecase userSignupUsecase;
  final UserLoginUsecase userLoginUsecase;

  AuthBloc({required this.userLoginUsecase, required this.userSignupUsecase})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<RegisterUser>(_registerUser);
    on<LoginUser>(_loginUser);
  }

  Future<void> _loginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    if (event.email.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Email can't be empty");
      return;
    }
    if (event.password.trim().isEmpty) {
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
          if (user.user != null) {
            LocalPreferenceService.instance.setToken(
              token: user.accessToken!,
            );
            LocalPreferenceService.instance.setUserId(
              userId: user.user?.id ?? 0,
            );
            LocalPreferenceService.instance.setUsername(
              username: user.user?.name ?? "",
            );
            LocalPreferenceService.instance.setEmail(
              email: user.user?.email ?? "",
            );
            LocalPreferenceService.instance.setPhone(
              phone: user.user?.phone ?? "",
            );

            LocalPreferenceService.instance.setProfilePic(
              profileImg: user.user?.avatarOriginal ?? "",
            );
          }
        } else if (user.message == "Please verify your account") {
          emit(AuthOtpSent(userId: user.userId.toString()));
        } else {
          emit(AuthFailure(error: user.message ?? "Login Failed"));
        }
      },
    );
  }

  Future<void> _registerUser(
      RegisterUser event, Emitter<AuthState> emit) async {
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
      caseSensitive: false,
    );
    if (event.name.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Name can't be empty");
      return;
    }
    if (!emailRegex.hasMatch(event.emailOrPhone.trim())) {
      Fluttertoast.showToast(msg: "Please, Enter valid email");
      return;
    }

    if (event.password.trim().length < 6) {
      Fluttertoast.showToast(
          msg: "Password must be contains at least 6 characters");
      return;
    }

    if (event.password.trim().toString() != event.confirmPassword.trim()) {
      Fluttertoast.showToast(msg: "Confirm password doesn't matched");
      return;
    }
    emit(RegisterLoading());
    final result = await userSignupUsecase.call(
      UserSignupParams(
        name: event.name,
        email: "",
        emailOrPhone: event.emailOrPhone,
        password: event.password,
        confirmPassword: event.confirmPassword,
        deviceToken: event.deviceToken,
        registerBy: "email",
      ),
    );
    result.fold(
      (error) => emit(RegisterFailure(error: error.message)),
      (user) {
        if (user.result == true) {
          emit(
            RegisterSuccess(
                message: user.message ?? "Registration Successfull"),
          );
          LocalPreferenceService.instance.setUserId(
            userId: user.userId!,
          );
        } else {}
      },
    );
  }
}
