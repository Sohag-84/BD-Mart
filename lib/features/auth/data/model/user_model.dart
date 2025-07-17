import 'package:gym_swat/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserModelEntity {
  UserModel({
    required super.result,
    required super.message,
    required super.accessToken,
    required super.tokenType,
    required super.expiresAt,
    required super.userId,
    required User? super.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      result: json["result"],
      message: json["message"],
      accessToken: json["access_token"],
      tokenType: json["token_type"],
      expiresAt: json["expires_at"],
      userId: json['user_id'],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }
}

class User extends UserEntity {
  User({
    required super.id,
    required super.type,
    required super.name,
    required super.email,
    required super.avatar,
    required super.avatarOriginal,
    required super.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      type: json["type"],
      name: json["name"],
      email: json["email"]?.toString(),
      avatar: json["avatar"]?.toString(),
      avatarOriginal: json["avatar_original"],
      phone: json["phone"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "name": name,
      "email": email,
      "avatar": avatar,
      "avatar_original": avatarOriginal,
      "phone": phone,
    };
  }
}
