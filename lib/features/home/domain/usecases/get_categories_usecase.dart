import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/home/domain/entity/category_entity.dart';
import 'package:gym_swat/features/home/domain/repositories/home_repository.dart';

class GetCategoriesUsecase implements Usecase<List<CategoryEntity>, NoParams> {
  final HomeRepository homeRepository;
  const GetCategoriesUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await homeRepository.getCategories();
  }
}
