class ProductModel {
  ProductModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.success,
    required this.status,
  });

  final List<Product> data;
  final ProductModelLinks? links;
  final Meta? meta;
  final bool? success;
  final int? status;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      data: json["data"] == null
          ? []
          : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
      links: json["links"] == null
          ? null
          : ProductModelLinks.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      success: json["success"],
      status: json["status"],
    );
  }
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.thumbnailImage,
    required this.hasDiscount,
    required this.discount,
    required this.strokedPrice,
    required this.mainPrice,
    required this.rating,
    required this.sales,
    required this.links,
  });

  final int? id;
  final String? name;
  final String? thumbnailImage;
  final bool? hasDiscount;
  final String? discount;
  final String? strokedPrice;
  final String? mainPrice;
  final dynamic rating;
  final int? sales;
  final ProductLinks? links;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      thumbnailImage: json["thumbnail_image"],
      hasDiscount: json["has_discount"],
      discount: json["discount"],
      strokedPrice: json["stroked_price"],
      mainPrice: json["main_price"],
      rating: json["rating"],
      sales: json["sales"],
      links:
          json["links"] == null ? null : ProductLinks.fromJson(json["links"]),
    );
  }
}

class ProductLinks {
  ProductLinks({
    required this.details,
  });

  final String? details;

  factory ProductLinks.fromJson(Map<String, dynamic> json) {
    return ProductLinks(
      details: json["details"],
    );
  }
}

class ProductModelLinks {
  ProductModelLinks({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final dynamic prev;
  final String? next;

  factory ProductModelLinks.fromJson(Map<String, dynamic> json) {
    return ProductModelLinks(
      first: json["first"],
      last: json["last"],
      prev: json["prev"],
      next: json["next"],
    );
  }
}

class Meta {
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

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link> links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json["current_page"],
      from: json["from"],
      lastPage: json["last_page"],
      links: json["links"] == null
          ? []
          : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json["url"],
      label: json["label"],
      active: json["active"],
    );
  }
}
