import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/home/domain/entity/slider_entity.dart';
import 'package:gym_swat/features/home/domain/repositories/home_repository.dart';

class GetSlidersUsecase implements Usecase<List<SliderEntity>, NoParams> {
  final HomeRepository homeRepository;
  const GetSlidersUsecase({required this.homeRepository});
  @override
  ResultFuture<List<SliderEntity>> call(NoParams params) async {
    return await homeRepository.getSliders();
  }
}
