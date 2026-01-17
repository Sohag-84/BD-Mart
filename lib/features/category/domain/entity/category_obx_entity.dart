import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryObxEntity {
  @Id()
  int id;
  final int categoryId;
  final String? name;
  final String? banner;
  final String? icon;
  final int? numberOfChildren;

  CategoryObxEntity({
    this.id = 0,
    required this.categoryId,
    required this.name,
    required this.banner,
    required this.icon,
    required this.numberOfChildren,
  });
}
