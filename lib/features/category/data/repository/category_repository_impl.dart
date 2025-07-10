import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/features/category/data/datasource/category_remote_datasource.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource categoryRemoteDatasource;
  const CategoryRepositoryImpl({required this.categoryRemoteDatasource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    final result =  await categoryRemoteDatasource.getCategories();
    return right(result);
  }
}
