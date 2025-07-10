import 'package:gym_swat/features/home/domain/entity/home_category_entity.dart';

class HomeCategoryModel extends HomeCategoryEntity {
  HomeCategoryModel({
    required super.id,
    required super.name,
    required super.banner,
    required super.icon,
    required super.numberOfChildren,
    required super.links,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json["id"],
      name: json["name"],
      banner: json["banner"],
      icon: json["icon"],
      numberOfChildren: json["number_of_children"],
      links: LinksModel.fromJson(json["links"]),
    );
  }
}

class LinksModel extends LinksEntity {
  LinksModel({
    required super.products,
    required super.subCategories,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      products: json["products"],
      subCategories: json["sub_categories"],
    );
  }
}
