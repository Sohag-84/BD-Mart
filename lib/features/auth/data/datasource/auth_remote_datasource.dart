import 'package:gym_swat/features/auth/data/model/user_model.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  });
}
