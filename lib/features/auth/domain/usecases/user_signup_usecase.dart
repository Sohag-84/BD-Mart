import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/domain/entity/user_signup_entity.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';

class UserSignupUsecase implements Usecase<void, UserSignupParams> {
  final AuthRepository authRepository;
  const UserSignupUsecase({required this.authRepository});

  @override
  ResultFuture<UserResponseEntity> call(params) async {
    return await authRepository.userSignup(
      name: params.name,
      emailOrPhone: params.emailOrPhone,
      email: params.email,
      password: params.password,
      retypePassword: params.confirmPassword,
      registerBy: params.registerBy,
      deviceToken: params.deviceToken,
    );
  }
}

class UserSignupParams {
  final String name;
  final String email;
  final String emailOrPhone;
  final String password;
  final String confirmPassword;
  final String deviceToken;
  final String registerBy;

  const UserSignupParams({
    required this.name,
    required this.email,
    required this.emailOrPhone,
    required this.password,
    required this.confirmPassword,
    required this.deviceToken,
    required this.registerBy,
  });
}
