import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/order_status/data/datasource/order_status_remote_datasource.dart';
import 'package:gym_swat/features/order_status/data/models/order_model.dart';
import 'package:gym_swat/features/order_status/data/models/order_status_model.dart';
import 'package:gym_swat/features/order_status/data/models/track_order_model.dart';

class OrderStatusRemoteDatasourceImpl implements OrderStatusRemoteDatasource {
  final ApiServices apiServices;

  OrderStatusRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<List<OrderModel>> getAllOrder({
    required int page,
    String? paymentStatus,
    String? deliveryStatus,
  }) async {
    String url = "${AppConfig.allOrders}?page=$page";
    if (paymentStatus != null) {
      url += "&payment_status=$paymentStatus";
    }
    if (deliveryStatus != null) {
      url += "&delivery_status=$deliveryStatus";
    }

    var response = await apiServices.getApi(
      fullApiUrl: url,
      requiresToken: true,
    );

    if (response['data'] != null) {
      final List<dynamic> allOrder = response['data'];
      return allOrder.map((json) => OrderModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<List<TrackOrderModel>> trackOrder({
    required String orderCode,
  }) async {
    var response = await apiServices.getApi(
      fullApiUrl: '${AppConfig.trackOrder}?order_code=$orderCode',
    );
    if (response['data'] != null) {
      final List<dynamic> trackOrder = response['data'];
      return trackOrder.map((json) => TrackOrderModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<OrderStatusModel> getOrderStatus() async {
    var response = await apiServices.getApi(
      fullApiUrl: AppConfig.orderStatus,
      requiresToken: true,
    );
    return OrderStatusModel.fromJson(response);
  }
}
