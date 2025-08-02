import 'package:gym_swat/features/auth/data/model/otp_model.dart';
import 'package:gym_swat/features/auth/data/model/user_model.dart';
import 'package:gym_swat/features/auth/data/model/user_signup_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserResponseModel> userSignup({
    required String name,
    required String emailOrPhone,
    required String email,
    required String password,
    required String retypePassword,
    required String registerBy,
    required String deviceToken,
  });

  Future<OtpModel> otpSubmit({
    required String userId,
    required String otpCode,
  });

  Future<String> otpResend({
    required String userId,
    required String registerBy,
  });

  Future<UserModel> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  });
}
