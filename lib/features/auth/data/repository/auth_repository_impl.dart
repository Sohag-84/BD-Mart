import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:gym_swat/features/auth/domain/entity/user_entity.dart';
import 'package:gym_swat/features/auth/domain/entity/user_signup_entity.dart';
import 'package:gym_swat/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  const AuthRepositoryImpl({required this.authRemoteDatasource});
  @override
  ResultFuture<UserModelEntity> userLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    try {
      final result = await authRemoteDatasource.userLogin(
        email: email,
        password: password,
        deviceToken: deviceToken,
      );
      return right(result);
    } on SocketException {
      return left(const NetworkFailure("No internet connection"));
    } on TimeoutException {
      return left(const NetworkFailure("Request timed out"));
    } catch (e) {
      return left(ServerFailure("Server error: $e"));
    }
  }

  @override
  ResultFuture<UserResponseEntity> userSignup({
    required String name,
    required String emailOrPhone,
    required String email,
    required String password,
    required String retypePassword,
    required String registerBy,
    required String deviceToken,
  }) async {
    try {
      final response = await authRemoteDatasource.userSignup(
        name: name,
        emailOrPhone: emailOrPhone,
        email: email,
        password: password,
        retypePassword: retypePassword,
        registerBy: registerBy,
        deviceToken: deviceToken,
      );

      return right(response);
    } on SocketException {
      return left(const NetworkFailure("No internet connection"));
    } on TimeoutException {
      return left(const NetworkFailure("Request timed out"));
    } catch (e) {
      return left(ServerFailure("Server error: $e"));
    }
  }
}
