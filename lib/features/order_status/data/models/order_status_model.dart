import 'package:gym_swat/features/order_status/domain/entities/order_status_entity.dart';

class OrderStatusModel extends OrderStatusEntity {
  OrderStatusModel({
    required super.pending,
    required super.confirmed,
    required super.pickedUp,
    required super.onTheWay,
    required super.cancelled,
    required super.delivered,
    required super.unpaid,
  });

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) {
    return OrderStatusModel(
      pending: json["pending"],
      confirmed: json["confirmed"],
      pickedUp: json["picked_up"],
      onTheWay: json["on_the_way"],
      cancelled: json["cancelled"],
      delivered: json["delivered"],
      unpaid: json["unpaid"],
    );
  }
}
