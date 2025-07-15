import 'package:gym_swat/features/product/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required List<ProductEntity> data,
    required ProductModelLinksEntity? links,
    required MetaEntity? meta,
    required bool? success,
    required int? status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      data: json["data"] == null
          ? []
          : List<ProductEntity>.from(
              json["data"]!.map((x) => Product.fromJson(x))),
      links: json["links"] == null
          ? null
          : ProductModelLinks.fromJson(json["links"]),
      meta: json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
      success: json["success"],
      status: json["status"],
    );
  }
}

class Product extends ProductEntity {
  Product({
    super.id,
    super.name,
    super.thumbnailImage,
    super.hasDiscount,
    super.discount,
    super.strokedPrice,
    super.mainPrice,
    super.rating,
    super.sales,
    super.links,
  });

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

class ProductLinks extends ProductLinksEntity {
  ProductLinks({super.details});

  factory ProductLinks.fromJson(Map<String, dynamic> json) {
    return ProductLinks(details: json["details"]);
  }
}

class ProductModelLinks extends ProductModelLinksEntity {
  ProductModelLinks({
    super.first,
    super.last,
    super.prev,
    super.next,
  });

  factory ProductModelLinks.fromJson(Map<String, dynamic> json) {
    return ProductModelLinks(
      first: json["first"],
      last: json["last"],
      prev: json["prev"],
      next: json["next"],
    );
  }
}

class MetaModel extends MetaEntity {
  MetaModel({
    super.currentPage,
    super.from,
    super.lastPage,
    required super.links,
    super.path,
    super.perPage,
    super.to,
    super.total,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      currentPage: json["current_page"],
      from: json["from"],
      lastPage: json["last_page"],
      links: json["links"] == null
          ? []
          : List<LinkEntity>.from(
              json["links"]!.map((x) => LinkModel.fromJson(x))),
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }
}

class LinkModel extends LinkEntity {
  LinkModel({super.url, super.label, super.active});

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      url: json["url"],
      label: json["label"],
      active: json["active"],
    );
  }
}
