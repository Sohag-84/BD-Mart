import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/category/data/datasource/category_remote_datasource.dart';
import 'package:gym_swat/features/category/data/model/category_model.dart';

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  final ApiServices apiServices;
  const CategoryRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<List<CategoryModel>> getCategories({required String url}) async {
    try {
      final response = await apiServices.getApi(endPoint: url);

      if (response['data'] != null) {
        final List<dynamic> categories = response['data'];
        return categories.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
