import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:gym_swat/features/auth/data/model/otp_model.dart';
import 'package:gym_swat/features/auth/data/model/user_model.dart';
import 'package:gym_swat/features/auth/data/model/user_signup_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiServices apiServices;
  const AuthRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<UserResponseModel> userSignup({
    required String name,
    required String emailOrPhone,
    required String email,
    required String password,
    required String retypePassword,
    required String registerBy,
    required String deviceToken,
  }) async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.signUp,
      isEncodedData: true,
      body: <String, dynamic>{
        "name": name,
        "email_or_phone": emailOrPhone,
        "email": email,
        "password": password,
        "passowrd_confirmation": retypePassword,
        "register_by": registerBy,
        "device_token": deviceToken,
      },
    );
    return UserResponseModel.fromJson(response);
  }

  @override
  Future<OtpModel> otpSubmit({
    required String userId,
    required String otpCode,
  }) async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.confirmOtp,
      isEncodedData: true,
      body: <String, dynamic>{
        "user_id": userId,
        "verification_code": otpCode,
      },
    );

    return OtpModel.fromJson(response);
  }

  @override
  Future<String> otpResend({
    required String userId,
    required String registerBy,
  }) async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.resendOtp,
      isEncodedData: true,
      body: <String, dynamic>{
        "user_id": userId,
        "register_by": registerBy,
      },
    );
    return response['message'];
  }

  @override
  Future<UserModel> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.login,
      isEncodedData: true,
      body: {
        "email": email,
        "password": password,
        "device_token": deviceToken,
      },
    );
    return UserModel.fromJson(response);
  }
}
