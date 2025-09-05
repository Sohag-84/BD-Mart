import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/address/data/datasource/shipping_address_remote_datasource.dart';
import 'package:gym_swat/features/address/domain/entities/shipping_address_entity.dart';
import 'package:gym_swat/features/address/domain/repository/address_repository.dart';

class ShippingAddressRepositoryImpl implements AddressRepository {
  final ShippingAddressRemoteDatasource shippingAddressRemoteDatasource;
  const ShippingAddressRepositoryImpl({
    required this.shippingAddressRemoteDatasource,
  });

  @override
  ResultFuture<String> addShippingAddress({
    required String address,
    required String postalCode,
    required String phoneNumber,
    required int cityId,
    required int stateId,
  }) async {
    try {
      final result = await shippingAddressRemoteDatasource.addShippingAddress(
        address: address,
        postalCode: postalCode,
        phoneNumber: phoneNumber,
        cityId: cityId,
        stateId: stateId,
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
  ResultFuture<List<ShippingAddressEntity>> getShippingAddress() async {
    try {
      final result = await shippingAddressRemoteDatasource.getShippingAddress();
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
  ResultFuture<String> updateShippingAddress({
    required int id,
    required String address,
    required String postalCode,
    required String phoneNumber,
    required int cityId,
    required int stateId,
  }) async {
    try {
      final result =
          await shippingAddressRemoteDatasource.updateShippingAddress(
        id: id,
        address: address,
        postalCode: postalCode,
        phoneNumber: phoneNumber,
        cityId: cityId,
        stateId: stateId,
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
}
