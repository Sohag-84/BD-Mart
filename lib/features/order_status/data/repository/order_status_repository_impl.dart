import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/order_status/data/datasource/order_status_remote_datasource.dart';
import 'package:gym_swat/features/order_status/data/models/order_model.dart';
import 'package:gym_swat/features/order_status/data/models/track_order_model.dart';
import 'package:gym_swat/features/order_status/domain/entities/order_status_entity.dart';
import 'package:gym_swat/features/order_status/domain/repository/order_status_repository.dart';

class OrderStatusRepositoryImpl implements OrderStatusRepository {
  final OrderStatusRemoteDatasource orderStatusRemoteDatasource;

  OrderStatusRepositoryImpl({required this.orderStatusRemoteDatasource});

  @override
  ResultFuture<List<OrderModel>> getAllOrder({
    required int page,
    String? paymentStatus,
    String? deliveryStatus,
  }) async {
    try {
      final result = await orderStatusRemoteDatasource.getAllOrder(
        page: page,
        paymentStatus: paymentStatus,
        deliveryStatus: deliveryStatus,
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
  ResultFuture<OrderStatusEntity> getOrderStatus() async {
    try {
      final result = await orderStatusRemoteDatasource.getOrderStatus();
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
  ResultFuture<List<TrackOrderModel>> trackOrder({
    required String orderCode,
  }) async {
    try {
      final result = await orderStatusRemoteDatasource.trackOrder(
        orderCode: orderCode,
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
