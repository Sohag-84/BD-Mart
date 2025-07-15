import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUsecase getProductUsecase;
  int currentPage = 1;
  bool hasReachedMax = false;
  bool isFetching = false;
  String? lastUrl;
  List<ProductEntity> productList = [];

  ProductBloc({required this.getProductUsecase}) : super(ProductInitial()) {
    on<ProductFetchedEvent>(_onProductFetched);
  }

  FutureOr<void> _onProductFetched(
    ProductFetchedEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (lastUrl != event.url) {
      lastUrl = event.url;
      currentPage = 1;
      hasReachedMax = false;
      productList.clear();
    }

    if (isFetching || (hasReachedMax && !event.isRefresh)) return;

    isFetching = true;

    //Emit fetching=true before making API call
    emit(
      ProductLoaded(
        productList: List.from(productList),
        hasReachedMax: hasReachedMax,
        isFetching: true,
      ),
    );

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
        if (products.isEmpty) {
          hasReachedMax = true;
        } else {
          productList.addAll(products);
          currentPage++;
        }

        isFetching = false;

        emit(
          ProductLoaded(
            productList: List.from(productList),
            hasReachedMax: hasReachedMax,
            isFetching: isFetching,
          ),
        );
      },
    );
  }
}
