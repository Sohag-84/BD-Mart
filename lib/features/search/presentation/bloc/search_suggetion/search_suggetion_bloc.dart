import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/search/domain/entity/search_suggetions_entity.dart';
import 'package:gym_swat/features/search/domain/usecases/get_search_suggetions_usecase.dart';

part 'search_suggetion_event.dart';
part 'search_suggetion_state.dart';

class SearchSuggetionBloc
    extends Bloc<SearchSuggetionEvent, SearchSuggetionState> {
  final GetSearchSuggetionsUsecase searchSuggetionsUsecase;
  SearchSuggetionBloc({
    required this.searchSuggetionsUsecase,
  }) : super(SearchSuggetionInitial()) {
    on<FetchedSearchSuggetions>(_fetchedSearchSuggetions);
  }

  Future<void> _fetchedSearchSuggetions(
    FetchedSearchSuggetions event,
    Emitter<SearchSuggetionState> emit,
  ) async {
    final result = await searchSuggetionsUsecase.call(
      SuggetionsParams(query: event.query),
    );

    result.fold(
      (error) => emit(SearchSuggetionFailure(error: error.message)),
      (suggetions) => emit(
        SearchSuggetionLoaded(suggetions: suggetions),
      ),
    );
  }
}
