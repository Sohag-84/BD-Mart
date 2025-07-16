import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit()
      : super(
          const PasswordVisibilityState(
            loginPasswordObscure: true,
            signupPasswordObscure: true,
            confirmPasswordObscure: true,
          ),
        );

  void toggleLoginPasswordVisibility() {
    emit(state.copyWith(loginPasswordObscure: !state.loginPasswordObscure));
  }

  void toggleSignupPasswordVisibility() {
    emit(state.copyWith(signupPasswordObscure: !state.signupPasswordObscure));
  }

  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(confirmPasswordObscure: !state.confirmPasswordObscure));
  }
}
