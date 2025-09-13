class TrackOrderResponse {
  final List<TrackOrderModel> data;
  final bool success;
  final int status;

  TrackOrderResponse({
    required this.data,
    required this.success,
    required this.status,
  });

  factory TrackOrderResponse.fromJson(Map<String, dynamic> json) {
    return TrackOrderResponse(
      data: List<TrackOrderModel>.from(
          json['data'].map((x) => TrackOrderModel.fromJson(x))),
      success: json['success'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
      'success': success,
      'status': status,
    };
  }
}

class TrackOrderModel {
  final int id;
  final String code;
  final int userId;
  final String paymentType;
  final String paymentStatus;
  final String paymentStatusString;
  final String deliveryStatus;
  final String deliveryStatusString;
  final String grandTotal;
  final String date;
  final OrderLinks links;

  TrackOrderModel({
    required this.id,
    required this.code,
    required this.userId,
    required this.paymentType,
    required this.paymentStatus,
    required this.paymentStatusString,
    required this.deliveryStatus,
    required this.deliveryStatusString,
    required this.grandTotal,
    required this.date,
    required this.links,
  });

  factory TrackOrderModel.fromJson(Map<String, dynamic> json) {
    return TrackOrderModel(
      id: json['id'],
      code: json['code'],
      userId: json['user_id'],
      paymentType: json['payment_type'],
      paymentStatus: json['payment_status'],
      paymentStatusString: json['payment_status_string'],
      deliveryStatus: json['delivery_status'],
      deliveryStatusString: json['delivery_status_string'],
      grandTotal: json['grand_total'],
      date: json['date'],
      links: OrderLinks.fromJson(json['links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'user_id': userId,
      'payment_type': paymentType,
      'payment_status': paymentStatus,
      'payment_status_string': paymentStatusString,
      'delivery_status': deliveryStatus,
      'delivery_status_string': deliveryStatusString,
      'grand_total': grandTotal,
      'date': date,
      'links': links.toJson(),
    };
  }
}

class OrderLinks {
  final String details;

  OrderLinks({
    required this.details,
  });

  factory OrderLinks.fromJson(Map<String, dynamic> json) {
    return OrderLinks(
      details: json['details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details,
    };
  }
}
