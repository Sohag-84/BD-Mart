part of 'password_visibility_cubit.dart';

class PasswordVisibilityState extends Equatable {
  final bool loginPasswordObscure;
  final bool signupPasswordObscure;
  final bool confirmPasswordObscure;
  const PasswordVisibilityState({
    required this.loginPasswordObscure,
    required this.signupPasswordObscure,
    required this.confirmPasswordObscure,
  });

  PasswordVisibilityState copyWith({
    bool? loginPasswordObscure,
    bool? signupPasswordObscure,
    bool? confirmPasswordObscure,
  }) {
    return PasswordVisibilityState(
      loginPasswordObscure: loginPasswordObscure ?? this.loginPasswordObscure,
      signupPasswordObscure:
          signupPasswordObscure ?? this.signupPasswordObscure,
      confirmPasswordObscure:
          confirmPasswordObscure ?? this.confirmPasswordObscure,
    );
  }

  @override
  List<Object> get props => [
        loginPasswordObscure,
        signupPasswordObscure,
        confirmPasswordObscure,
      ];
}
