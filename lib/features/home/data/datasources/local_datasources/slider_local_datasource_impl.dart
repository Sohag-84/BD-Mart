import 'package:gym_swat/features/home/data/datasources/local_datasources/slider_local_datasource.dart';
import 'package:gym_swat/features/home/domain/entity/slider_entity.dart';
import 'package:gym_swat/features/home/domain/entity/slider_obx_entity.dart';
import 'package:gym_swat/objectbox.g.dart';

class SliderLocalDatasourceImpl implements SliderLocalDatasource {
  final Box<SliderObxEntity> sliderBox;
  const SliderLocalDatasourceImpl({required this.sliderBox});

  @override
  Future<List<SliderEntity>> getSliders() async {
    return sliderBox
        .getAll()
        .map((slider) => SliderEntity(photo: slider.photo))
        .toList();
  }

  @override
  Future<void> saveSliders({required List<SliderEntity> sliders}) async {
    sliderBox.removeAll();

    sliderBox.putMany(
        sliders.map((slider) => SliderObxEntity(photo: slider.photo)).toList());
  }

  @override
  Future<void> clearSliders() async {
    sliderBox.removeAll();
  }
}
