import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/model/response_model.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/auth/data/datasource/auth_remote_datasource.dart';
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
  Future<ResponseModel> otpSubmit({
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

    return ResponseModel.fromJson(response);
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
      body: <String, dynamic>{
        "email": email,
        "password": password,
        "device_token": deviceToken,
      },
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<ResponseModel> forgetPasswordRequest({
    required String emailOrPhone,
    required String sendCodeBy,
  }) async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.forgetPassword,
      isEncodedData: true,
      body: <String, dynamic>{
        "email_or_phone": emailOrPhone,
        "send_code_by": sendCodeBy,
      },
    );
    return ResponseModel.fromJson(response);
  }

  @override
  Future<ResponseModel> forgetPasswordConfirm({
    required String verificationCode,
    required String newPassword,
  }) async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.confrimReset,
      isEncodedData: true,
      body: <String, dynamic>{
        "verification_code": verificationCode,
        "password": newPassword,
      },
    );
    return ResponseModel.fromJson(response);
  }
}
