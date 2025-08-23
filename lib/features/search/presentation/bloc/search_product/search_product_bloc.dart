import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/search/domain/usecases/get_search_product_usecase.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final GetSearchProductUsecase searchProductUsecase;
  SearchProductBloc({required this.searchProductUsecase})
      : super(SearchProductInitial()) {
    on<FetchedSearchProduct>(_fetchedSearchProduct);
  }

  Future<void> _fetchedSearchProduct(
    FetchedSearchProduct event,
    Emitter<SearchProductState> emit,
  ) async {
    emit(SearchProductLoading());
    final result = await searchProductUsecase.call(
      SearchProductParams(
        query: event.query,
        page: 1,
      ),
    );

    result.fold(
      (error) => emit(
        SearchProductFailure(error: error.message),
      ),
      (products) => emit(
        SearchProductLoaded(products: products),
      ),
    );
  }
}
