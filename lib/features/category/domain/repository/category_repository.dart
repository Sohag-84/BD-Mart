import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';

abstract interface class CategoryRepository {
  ResultFuture<List<CategoryEntity>> getCategories({required String url});
}
