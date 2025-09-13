class OrderModelResponse {
  bool success;
  int status;
  List<OrderModel> data;
  Links links;
  Meta meta;

  OrderModelResponse({
    required this.success,
    required this.status,
    required this.data,
    required this.links,
    required this.meta,
  });

  factory OrderModelResponse.fromJson(Map<String, dynamic> json) {
    return OrderModelResponse(
      success: json['success'],
      status: json['status'],
      data: (json['data'] as List)
          .map((item) => OrderModel.fromJson(item))
          .toList(),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class OrderModel {
  int id;
  String code;
  int userId;
  String paymentType;
  String paymentStatus;
  String paymentStatusString;
  String deliveryStatus;
  String deliveryStatusString;
  String grandTotal;
  String date;
  Links details;

  OrderModel({
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
    required this.details,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
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
      details: Links.fromJson(json['links']),
    );
  }
}

class Links {
  String details;

  Links({
    required this.details,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      details: json['details'] ?? '',
    );
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<PageLink> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links: (json['links'] as List)
          .map((link) => PageLink.fromJson(link))
          .toList(),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class PageLink {
  String? url;
  String label;
  bool active;

  PageLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
