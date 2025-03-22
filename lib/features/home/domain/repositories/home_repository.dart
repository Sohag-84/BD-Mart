import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/features/home/domain/entity/category_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
