import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/home/domain/entity/home_category_entity.dart';
import 'package:gym_swat/features/home/domain/repositories/home_repository.dart';

class GetHomeCategoriesUsecase implements Usecase<List<HomeCategoryEntity>, NoParams> {
  final HomeRepository homeRepository;
  const GetHomeCategoriesUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, List<HomeCategoryEntity>>> call(NoParams params) async {
    return await homeRepository.getCategories();
  }
}
