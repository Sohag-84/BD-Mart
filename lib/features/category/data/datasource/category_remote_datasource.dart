import 'package:gym_swat/features/category/domain/entity/category_entity.dart';

abstract interface class CategoryRemoteDatasource {
  Future<List<CategoryEntity>> getCategories();
}
