import 'package:gym_swat/features/category/data/datasource/local/category_local_datasource.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/entity/category_obx_entity.dart';
import 'package:gym_swat/objectbox.g.dart';

class CategoryLocalDatasourceImpl implements CategoryLocalDatasource {
  final Box<CategoryObxEntity> categoryBox;
  const CategoryLocalDatasourceImpl({required this.categoryBox});

  @override
  Future<void> clearCategory() async {
    categoryBox.removeAll();
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return categoryBox.getAll().map((category) {
      return CategoryEntity(
        id: category.categoryId,
        name: category.name,
        banner: category.banner,
        icon: category.icon,
        numberOfChildren: category.numberOfChildren,
        links: LinksEntity(
          products: "",
          subCategories: "",
        ),
      );
    }).toList();
  }

  @override
  Future<void> saveCategory({
    required List<CategoryEntity> categories,
  }) async {
    categoryBox.removeAll();
    for (var category in categories) {
      final existing = categoryBox
          .query(CategoryObxEntity_.categoryId.equals(category.id))
          .build()
          .findFirst();

      if (existing == null) {
        categoryBox.put(
          CategoryObxEntity(
            categoryId: category.id,
            name: category.name,
            banner: category.banner,
            icon: category.icon,
            numberOfChildren: category.numberOfChildren,
          ),
        );
      }
    }
  }
}
