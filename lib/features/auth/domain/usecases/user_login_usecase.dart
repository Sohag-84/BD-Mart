import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/domain/entities/user_entity.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';

class UserLoginUsecase implements Usecase<void, UserLoginParams> {
  final AuthRepository authRepository;
  const UserLoginUsecase({required this.authRepository});

  @override
  ResultFuture<UserModelEntity> call(UserLoginParams params) async {
    return await authRepository.userLogin(
      email: params.email,
      password: params.password,
      deviceToken: params.deviceToken,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;
  final String deviceToken;

  const UserLoginParams({
    required this.email,
    required this.password,
    required this.deviceToken,
  });
}
