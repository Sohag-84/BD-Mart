import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/search/data/datasource/search_remote_datasource.dart';
import 'package:gym_swat/features/search/data/model/search_suggetions_model.dart';

class SearchRemoteDatasourceImpl implements SearchRemoteDatasource {
  final ApiServices apiServices;
  const SearchRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<List<Product>> getSearchProduct({
    required String searchQuery,
    required int page,
  }) async {
    final response = await apiServices.getApi(
      fullApiUrl: "${AppConfig.search}$searchQuery&page=$page",
    );

    if (response['data'] != null) {
      final List<dynamic> product = response['data'];
      return product.map((json) => Product.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<List<SearchSuggetionsModel>> getSearchSuggestions(
      {required String searchQuery}) async {
    var response = await apiServices.getApi(
      fullApiUrl:
          "${AppConfig.searchSuggetions}?query_key=$searchQuery&type=product",
    );

    final List<dynamic> suggestions = response;
    return suggestions
        .map((json) => SearchSuggetionsModel.fromJson(json))
        .toList();
  }
}
