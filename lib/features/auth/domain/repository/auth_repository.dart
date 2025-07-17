import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/domain/entity/user_entity.dart';

abstract interface class AuthRepository {
  ResultFuture<UserModelEntity> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  });
}
