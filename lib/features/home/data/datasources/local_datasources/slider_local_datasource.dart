import 'package:gym_swat/features/home/domain/entity/slider_entity.dart';

abstract interface class SliderLocalDatasource {
  Future<List<SliderEntity>> getSliders();
  Future<void> saveSliders({required List<SliderEntity> sliders});
  Future<void> clearSliders();
}
