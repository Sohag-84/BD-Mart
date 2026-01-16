import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/services/network_service.dart';
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
  bool isOffline = false;
  final ConnectionChecker connectionChecker;

  List<ProductEntity> productList = [];

  ProductBloc({
    required this.getProductUsecase,
    required this.connectionChecker,
  }) : super(ProductInitial()) {
    on<ProductFetchedEvent>(_onProductFetched);
  }

  FutureOr<void> _onProductFetched(
    ProductFetchedEvent event,
    Emitter<ProductState> emit,
  ) async {
    isOffline = !(await connectionChecker.isConnected);

    /// RESET when refresh
    if (event.isRefresh) {
      currentPage = 1;
      hasReachedMax = false;
      productList.clear();
    }

    // offline pagination stop (but allow refresh)
    if (isOffline && currentPage > 1 && !event.isRefresh) {
      hasReachedMax = true;
      return;
    }

    if (lastUrl != event.url) {
      lastUrl = event.url;
      currentPage = 1;
      hasReachedMax = false;
      productList.clear();
    }

    if (isFetching || hasReachedMax) return;

    isFetching = true;

    if (currentPage == 1) {
      emit(ProductLoading());
    }

    final result = await getProductUsecase(
      ProductPaginationParams(
        url: event.url,
        page: currentPage,
      ),
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
          final newProducts = products.where(
            (p) => !productList.any((e) => e.id == p.id),
          );

          productList.addAll(newProducts);
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
