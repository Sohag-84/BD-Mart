import 'package:gym_swat/features/category/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.banner,
    required super.icon,
    required super.numberOfChildren,
    required super.links,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
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
