class OrderStatusEntity {
  OrderStatusEntity({
    required this.pending,
    required this.confirmed,
    required this.pickedUp,
    required this.onTheWay,
    required this.cancelled,
    required this.delivered,
    required this.unpaid,
  });

  final int? pending;
  final int? confirmed;
  final int? pickedUp;
  final int? onTheWay;
  final int? cancelled;
  final int? delivered;
  final int? unpaid;
}
