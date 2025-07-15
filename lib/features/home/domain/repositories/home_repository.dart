import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/home/domain/entity/slider_entity.dart';

abstract interface class HomeRepository {
  ResultFuture<List<SliderEntity>> getSliders();
}
