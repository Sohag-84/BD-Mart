import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/domain/entities/otp_entity.dart';
import 'package:gym_swat/features/auth/domain/entities/user_entity.dart';
import 'package:gym_swat/features/auth/domain/entities/user_signup_entity.dart';

abstract interface class AuthRepository {
  ResultFuture<UserResponseEntity> userSignup({
    required String name,
    required String emailOrPhone,
    required String email,
    required String password,
    required String retypePassword,
    required String registerBy,
    required String deviceToken,
  });

  ResultFuture<OtpEntity> otpSubmit({
    required String userId,
    required String otpCode,
  });

  ResultFuture<String> otpResend({
    required String userId,
    required String registerBy,
  });

  ResultFuture<UserModelEntity> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  });
}
