import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/search/domain/usecases/get_search_product_usecase.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final GetSearchProductUsecase searchProductUsecase;
  List<ProductEntity> productList = [];
  int currentPage = 1;
  bool hasReachedMax = false;
  bool isFetching = false;
  SearchProductBloc({required this.searchProductUsecase})
      : super(SearchProductInitial()) {
    on<FetchedSearchProduct>(_fetchedSearchProduct);
  }

  Future<void> _fetchedSearchProduct(
    FetchedSearchProduct event,
    Emitter<SearchProductState> emit,
  ) async {
    if (isFetching || (hasReachedMax && !event.isRefresh)) return;
    isFetching = true;

    if (event.isRefresh) {
      currentPage = 1;
      hasReachedMax = false;
      productList.clear();
      emit(SearchProductLoading());
    } else if (currentPage == 1) {
      emit(SearchProductLoading());
    } else {
      emit(SearchProductLoaded(
        products: List.from(productList),
        hasReachedMax: hasReachedMax,
        isFetching: true,
      ));
    }

    final result = await searchProductUsecase.call(
      SearchProductParams(query: event.query, page: currentPage),
    );

    result.fold(
      (error) {
        isFetching = false;
        emit(SearchProductFailure(error: error.message));
      },
      (products) {
        if (products.isEmpty) {
          hasReachedMax = true;
        } else {
          productList.addAll(products);
          currentPage++;
        }

        isFetching = false;

        emit(SearchProductLoaded(
          products: List.from(productList),
          hasReachedMax: hasReachedMax,
          isFetching: false,
        ));
      },
    );
  }
}
