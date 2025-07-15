class ProductDetailsEntity {
  final int? id;
  final String? name;
  final String? addedBy;
  final int? sellerId;
  final int? shopId;
  final String? shopName;
  final String? shopLogo;
  final List<PhotoEntity> photos;
  final String? thumbnailImage;
  final List<String> tags;
  final String? priceHighLow;
  final List<ChoiceOptionEntity> choiceOptions;
  final List<String> colors;
  final bool? hasDiscount;
  final String? discount;
  final String? strokedPrice;
  final String? mainPrice;
  final int? calculablePrice;
  final String? currencySymbol;
  final int? currentStock;
  final String? unit;
  final int? rating;
  final int? ratingCount;
  final int? earnPoint;
  final String? description1StPart;
  final String? description2NdPart;
  final String? description;
  final String? videoLink;
  final BrandEntity? brand;
  final dynamic couponCode;
  final String? link;

  ProductDetailsEntity({
    required this.id,
    required this.name,
    required this.addedBy,
    required this.sellerId,
    required this.shopId,
    required this.shopName,
    required this.shopLogo,
    required this.photos,
    required this.thumbnailImage,
    required this.tags,
    required this.priceHighLow,
    required this.choiceOptions,
    required this.colors,
    required this.hasDiscount,
    required this.discount,
    required this.strokedPrice,
    required this.mainPrice,
    required this.calculablePrice,
    required this.currencySymbol,
    required this.currentStock,
    required this.unit,
    required this.rating,
    required this.ratingCount,
    required this.earnPoint,
    required this.description1StPart,
    required this.description2NdPart,
    required this.description,
    required this.videoLink,
    required this.brand,
    required this.couponCode,
    required this.link,
  });
}

class PhotoEntity {
  final String? variant;
  final String? path;

  PhotoEntity({required this.variant, required this.path});
}

class ChoiceOptionEntity {
  final String? name;
  final String? title;
  final List<String> options;

  ChoiceOptionEntity({
    required this.name,
    required this.title,
    required this.options,
  });
}

class BrandEntity {
  final int? id;
  final String? name;
  final String? logo;

  BrandEntity({
    required this.id,
    required this.name,
    required this.logo,
  });
}
