import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/search/domain/repository/search_repository.dart';

class GetSearchProductUsecase
    implements Usecase<List<ProductEntity>, SearchProductParams> {
  final SearchRepository searchRepository;
  const GetSearchProductUsecase({required this.searchRepository});

  @override
  ResultFuture<List<ProductEntity>> call(SearchProductParams params) async {
    return await searchRepository.filterSearchProducts(
      searchQuery: params.query,
      page: params.page,
    );
  }
}

class SearchProductParams {
  final String query;
  final int page;

  const SearchProductParams({required this.query, required this.page});
}
