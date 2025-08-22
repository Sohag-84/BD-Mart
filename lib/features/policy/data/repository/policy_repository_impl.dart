import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/policy/data/datasource/policy_remote_datasource.dart';
import 'package:gym_swat/features/policy/domain/entity/policy_entity.dart';
import 'package:gym_swat/features/policy/domain/repository/policy_repository.dart';

class PolicyRepositoryImpl implements PolicyRepository {
  final PolicyRemoteDatasource policyRemoteDatasource;
  const PolicyRepositoryImpl({required this.policyRemoteDatasource});

  @override
  ResultFuture<List<PolicyEntity>> getPolicy() async {
    try {
      final result = await policyRemoteDatasource.getPolicy();
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
  ResultFuture<List<PolicyEntity>> getTermsAndCondition() async {
    try {
      final result = await policyRemoteDatasource.getTermsAndCondition();
      return right(result);
    } on SocketException {
      return left(const NetworkFailure("No internet connection"));
    } on TimeoutException {
      return left(const NetworkFailure("Request timed out"));
    } catch (e) {
      return left(ServerFailure("Server error: $e"));
    }
  }
}
