import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:gym_swat/features/auth/data/model/user_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiServices apiServices;
  const AuthRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<UserModel> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    try {
      final response = await apiServices.postApi(
        endPoint: AppConfig.login,
        isEncodedData: true,
        body: {
          "email": email,
          "password": password,
          "device_token": deviceToken,
        },
      );
      print(response);
      return UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
