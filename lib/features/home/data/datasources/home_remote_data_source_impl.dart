import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/home/data/datasources/home_remote_data_source.dart';
import 'package:gym_swat/features/home/data/models/slider_model.dart';

final class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;
  const HomeRemoteDataSourceImpl({required this.apiServices});

  ///get slider
  @override
  Future<List<SliderModel>> getSliders() async {
    final response = await apiServices.getApi(endPoint: AppConfig.slider);

    if (response['data'] != null) {
      final List<dynamic> sliders = response['data'];
      return sliders.map((json) => SliderModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
