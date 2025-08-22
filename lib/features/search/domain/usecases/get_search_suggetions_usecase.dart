import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/search/domain/entity/search_suggetions_entity.dart';
import 'package:gym_swat/features/search/domain/repository/search_repository.dart';

class GetSearchSuggetionsUsecase
    implements Usecase<List<SearchSuggetionsEntity>, SuggetionsParams> {
  final SearchRepository searchRepository;
  const GetSearchSuggetionsUsecase({required this.searchRepository});
  @override
  ResultFuture<List<SearchSuggetionsEntity>> call(
      SuggetionsParams params) async {
    return await searchRepository.getSearchSuggestions(
      searchQuery: params.query,
    );
  }
}

class SuggetionsParams {
  final String query;

  const SuggetionsParams({required this.query});
}
