import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';

abstract interface class CategoryRepository {
  Future<Either<Failure,List<CategoryEntity>>> getCategories();
}