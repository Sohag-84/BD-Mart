import 'package:gym_swat/features/auth/domain/entity/user_signup_entity.dart';

class UserResponseModel extends UserResponseEntity {
  UserResponseModel({
    required super.result,
    required super.message,
    required super.userId,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      result: json["result"],
      message: json["message"],
      userId: json["user_id"],
    );
  }
}
