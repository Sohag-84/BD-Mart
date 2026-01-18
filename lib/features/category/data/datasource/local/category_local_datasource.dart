import 'package:gym_swat/features/category/domain/entity/category_entity.dart';

abstract interface class CategoryLocalDatasource {
  Future<List<CategoryEntity>> getCategories();
  Future<void> saveCategory({required List<CategoryEntity> categories});
  Future<void> clearCategory();
}
