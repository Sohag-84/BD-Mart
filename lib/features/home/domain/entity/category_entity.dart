class CategoryEntity {
  final int id;
  final String? name;
  final String? banner;
  final String? icon;
  final int? numberOfChildren;
  final LinksEntity links;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.banner,
    required this.icon,
    required this.numberOfChildren,
    required this.links,
  });
}

class LinksEntity {
  final String products;
  final String subCategories;

  LinksEntity({
    required this.products,
    required this.subCategories,
  });
}
