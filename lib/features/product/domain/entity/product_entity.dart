class ProductEntity {
  final int? id;
  final String? name;
  final String? thumbnailImage;
  final bool? hasDiscount;
  final String? discount;
  final String? strokedPrice;
  final String? mainPrice;
  final dynamic rating;
  final int? sales;
  final ProductLinksEntity? links;

  ProductEntity({
    this.id,
    this.name,
    this.thumbnailImage,
    this.hasDiscount,
    this.discount,
    this.strokedPrice,
    this.mainPrice,
    this.rating,
    this.sales,
    this.links,
  });
}

class ProductLinksEntity {
  final String? details;

  ProductLinksEntity({this.details});
}

class ProductModelLinksEntity {
  final String? first;
  final String? last;
  final dynamic prev;
  final String? next;

  ProductModelLinksEntity({
    this.first,
    this.last,
    this.prev,
    this.next,
  });
}

class MetaEntity {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<LinkEntity> links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  MetaEntity({
    this.currentPage,
    this.from,
    this.lastPage,
    required this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });
}

class LinkEntity {
  final String? url;
  final String? label;
  final bool? active;

  LinkEntity({this.url, this.label, this.active});
}

class ProductListEntity {
  final List<ProductEntity> data;
  final ProductModelLinksEntity? links;
  final MetaEntity? meta;
  final bool? success;
  final int? status;

  ProductListEntity({
    required this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });
}
