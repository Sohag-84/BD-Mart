import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/search/domain/entity/search_suggetions_entity.dart';

abstract interface class SearchRepository {
  ResultFuture<List<ProductEntity>> getSearchProduct({
    required String searchQuery,
    required int page,
  });
  ResultFuture<List<SearchSuggetionsEntity>> getSearchSuggestions({
    required String searchQuery,
  });
}
