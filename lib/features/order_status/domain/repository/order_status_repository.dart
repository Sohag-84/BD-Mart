import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/order_status/data/models/order_model.dart';
import 'package:gym_swat/features/order_status/data/models/track_order_model.dart';
import 'package:gym_swat/features/order_status/domain/entities/order_status_entity.dart';

abstract interface class OrderStatusRepository {
  ResultFuture<List<OrderModel>> getAllOrder({
    required int page,
    String? paymentStatus,
    String? deliveryStatus,
  });

  ResultFuture<List<TrackOrderModel>> trackOrder({
    required String orderCode,
  });

  ResultFuture<OrderStatusEntity> getOrderStatus();
}
