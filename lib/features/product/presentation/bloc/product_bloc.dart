import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUsecase getProductUsecase;
  int currentPage = 1;
  bool hasReachedMax = false;
  bool isFetching = false;
  String? lastUrl;
  List<Product> productList = [];

  ProductBloc({required this.getProductUsecase}) : super(ProductInitial()) {
    on<ProductFetchedEvent>(_onProductFetched);
  }

  FutureOr<void> _onProductFetched(
    ProductFetchedEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (lastUrl != event.url) {
      // reset if a new URL
      lastUrl = event.url;
      currentPage = 1;
      hasReachedMax = false;
      productList.clear();
    }

    if (isFetching || (hasReachedMax && !event.isRefresh)) return;

    isFetching = true;

    if (event.isRefresh) {
      currentPage = 1;
      hasReachedMax = false;
      productList.clear();
    }

    if (currentPage == 1) {
      emit(ProductLoading());
    }

    final result = await getProductUsecase(
      ProductPaginationParams(url: event.url, page: currentPage),
    );

    result.fold(
      (failure) {
        isFetching = false;
        emit(ProductLoadingFailed(message: failure.message));
      },
      (products) {
        isFetching = false;
        if (products.isEmpty) {
          hasReachedMax = true;
        } else {
          currentPage++;
          productList.addAll(products);
        }

        emit(
          ProductLoaded(
            productList: List.from(productList),
            hasReachedMax: hasReachedMax,
          ),
        );
      },
    );
  }
}
