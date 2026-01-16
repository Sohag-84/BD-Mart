import 'package:gym_swat/features/home/data/models/slider_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<SliderModel>> getSliders();
}
