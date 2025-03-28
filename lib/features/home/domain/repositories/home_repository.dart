import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/features/home/domain/entity/category_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/features/home/domain/entity/slider_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<SliderEntity>>> getSliders();
}
