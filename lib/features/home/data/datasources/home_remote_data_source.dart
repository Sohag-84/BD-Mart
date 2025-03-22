import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/home/data/models/category_model.dart';
import 'package:gym_swat/service_locator.dart';
import 'package:http/http.dart' as http;

abstract interface class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

final class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  const HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final apiServices = sl<ApiServices>();
    try {
      final response = await apiServices.getApi(endPoint: AppConfig.category);

      if (response['data'] != null) {
        final List<dynamic> categories = response['data'];
        return categories.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
