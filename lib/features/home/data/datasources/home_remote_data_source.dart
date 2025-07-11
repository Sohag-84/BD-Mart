import 'package:gym_swat/features/home/data/models/home_category_model.dart';
import 'package:gym_swat/features/home/data/models/slider_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<HomeCategoryModel>> getCategories();
  Future<List<SliderModel>> getSliders();
}
