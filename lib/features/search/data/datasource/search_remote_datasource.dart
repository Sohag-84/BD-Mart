import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/search/data/model/search_suggetions_model.dart';

abstract interface class SearchRemoteDatasource {
  Future<List<Product>> getSearchProduct({
    required String searchQuery,
    required int page,
  });
  Future<List<SearchSuggetionsModel>> getSearchSuggestions({
    required String searchQuery,
  });
}
