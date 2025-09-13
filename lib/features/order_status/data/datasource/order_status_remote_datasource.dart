import 'package:gym_swat/features/order_status/data/models/order_model.dart';
import 'package:gym_swat/features/order_status/data/models/order_status_model.dart';
import 'package:gym_swat/features/order_status/data/models/track_order_model.dart';

abstract interface class OrderStatusRemoteDatasource {
  Future<List<OrderModel>> getAllOrder({
    required int page,
    String? paymentStatus,
    String? deliveryStatus,
  });

  Future<List<TrackOrderModel>> trackOrder({
    required String orderCode,
  });

  Future<OrderStatusModel> getOrderStatus();
}
