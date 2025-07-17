class UserEntity {
  final int? id;
  final String? type;
  final String? name;
  final String? email;
  final String? avatar;
  final String? avatarOriginal;
  final String? phone;

  UserEntity({
    required this.id,
    required this.type,
    required this.name,
    required this.email,
    required this.avatar,
    required this.avatarOriginal,
    required this.phone,
  });
}

class UserModelEntity {
  final bool? result;
  final String? message;
  final String? accessToken;
  final String? tokenType;
  final dynamic expiresAt;
  final int? userId;
  final UserEntity? user;

  UserModelEntity({
    required this.result,
    required this.message,
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
    required this.userId,
    required this.user,
  });
}
