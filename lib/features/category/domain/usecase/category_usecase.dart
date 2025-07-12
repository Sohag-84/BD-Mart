import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/repository/category_repository.dart';

class CategoryUsecase implements Usecase<List<CategoryEntity>, CategoryParam> {
  final CategoryRepository categoryRepository;
  const CategoryUsecase({required this.categoryRepository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(CategoryParam params) async {
    return await categoryRepository.getCategories(url: params.url);
  }
}
class CategoryParam{
  final String url;
  const CategoryParam({required this.url});
}