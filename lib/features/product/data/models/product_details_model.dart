import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    required super.photos,
    required super.choiceOptions,
    required super.id,
    required super.name,
    required super.addedBy,
    required super.sellerId,
    required super.shopId,
    required super.shopName,
    required super.shopLogo,
    required super.thumbnailImage,
    required super.tags,
    required super.priceHighLow,
    required super.colors,
    required super.hasDiscount,
    required super.discount,
    required super.strokedPrice,
    required super.mainPrice,
    required super.calculablePrice,
    required super.currencySymbol,
    required super.currentStock,
    required super.unit,
    required super.rating,
    required super.ratingCount,
    required super.earnPoint,
    required super.description1StPart,
    required super.description2NdPart,
    required super.description,
    required super.videoLink,
    required super.brand,
    required super.couponCode,
    required super.link,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json["id"],
      name: json["name"],
      addedBy: json["added_by"],
      sellerId: json["seller_id"],
      shopId: json["shop_id"],
      shopName: json["shop_name"],
      shopLogo: json["shop_logo"],
      photos: json["photos"] == null
          ? []
          : List<PhotoEntity>.from(
              json["photos"].map((x) => PhotoModel.fromJson(x))),
      thumbnailImage: json["thumbnail_image"],
      tags: json["tags"] == null ? [] : List<String>.from(json["tags"]),
      priceHighLow: json["price_high_low"],
      choiceOptions: json["choice_options"] == null
          ? []
          : List<ChoiceOptionEntity>.from(
              json["choice_options"].map((x) => ChoiceOptionModel.fromJson(x))),
      colors: json["colors"] == null ? [] : List<String>.from(json["colors"]),
      hasDiscount: json["has_discount"],
      discount: json["discount"],
      strokedPrice: json["stroked_price"],
      mainPrice: json["main_price"],
      calculablePrice: json["calculable_price"],
      currencySymbol: json["currency_symbol"],
      currentStock: json["current_stock"],
      unit: json["unit"],
      rating: json["rating"],
      ratingCount: json["rating_count"],
      earnPoint: json["earn_point"],
      description1StPart: json["description_1st_part"],
      description2NdPart: json["description_2nd_part"],
      description: json["description"],
      videoLink: json["video_link"],
      brand: json["brand"] == null ? null : BrandModel.fromJson(json["brand"]),
      couponCode: json["coupon_code"],
      link: json["link"],
    );
  }
}

class PhotoModel extends PhotoEntity {
  PhotoModel({required super.variant, required super.path});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      variant: json["variant"],
      path: json["path"],
    );
  }
}

class ChoiceOptionModel extends ChoiceOptionEntity {
  ChoiceOptionModel({
    required super.name,
    required super.title,
    required super.options,
  });

  factory ChoiceOptionModel.fromJson(Map<String, dynamic> json) {
    return ChoiceOptionModel(
      name: json["name"],
      title: json["title"],
      options:
          json["options"] == null ? [] : List<String>.from(json["options"]),
    );
  }
}

class BrandModel extends BrandEntity {
  BrandModel({required super.id, required super.name, required super.logo});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
    );
  }
}
