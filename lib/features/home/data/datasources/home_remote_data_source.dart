import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/home/data/models/home_category_model.dart';
import 'package:gym_swat/features/home/data/models/slider_model.dart';
import 'package:gym_swat/service_locator.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<HomeCategoryModel>> getCategories();
  Future<List<SliderModel>> getSliders();
}

final class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final apiServices = sl<ApiServices>();

  ///get categories
  @override
  Future<List<HomeCategoryModel>> getCategories() async {
    try {
      final response = await apiServices.getApi(endPoint: AppConfig.category);

      if (response['data'] != null) {
        final List<dynamic> categories = response['data'];
        return categories
            .map((json) => HomeCategoryModel.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Unexpected error from category api: $e');
    }
  }

  ///get slider
  @override
  Future<List<SliderModel>> getSliders() async {
    try {
      final response = await apiServices.getApi(endPoint: AppConfig.slider);

      if (response['data'] != null) {
        final List<dynamic> sliders = response['data'];
        return sliders.map((json) => SliderModel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Unexpected error from slider api: $e');
    }
  }
}
