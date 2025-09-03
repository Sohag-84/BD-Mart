import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_counter_entity.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_entity.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_summary_entity.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource cartRemoteDatasource;
  const CartRepositoryImpl({required this.cartRemoteDatasource});

  @override
  ResultFuture<String> addToCart({
    required String productId,
    required String variant,
    required String color,
    required String quantity,
  }) async {
    try {
      final result = await cartRemoteDatasource.addToCart(
        productId: productId,
        variant: variant,
        color: color,
        quantity: quantity,
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
  ResultFuture<void> deleteCartItem({required String productId}) async {
    try {
      final result = await cartRemoteDatasource.deleteCartItem(
        productId: productId,
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
  ResultFuture<List<CartEntity>> getCartItems() async {
    try {
      final result = await cartRemoteDatasource.getCartItems();
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
  ResultFuture<void> updateCartQuantity({
    required String productId,
    required String quantity,
  }) async {
    try {
      final result = await cartRemoteDatasource.updateCartQuantity(
        productId: productId,
        quantity: quantity,
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
  ResultFuture<CartCounterEntity> getCartCounter() async {
    try {
      final result = await cartRemoteDatasource.getCartCounter();
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
  ResultFuture<CartSummaryEntity> getCartSummary() async {
    try {
      final result = await cartRemoteDatasource.getCartSummary();
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
