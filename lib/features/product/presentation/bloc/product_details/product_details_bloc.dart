import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_details_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUsecase productDetailsUsecase;
  ProductDetailsBloc({required this.productDetailsUsecase})
      : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) {});

    on<ProductDetailsFetch>(_productDetailsFetch);
  }

  FutureOr<void> _productDetailsFetch(
    ProductDetailsFetch event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoading());
    final result = await productDetailsUsecase.call(
      ProductIdParam(
        productId: event.productId,
      ),
    );

    result.fold(
      (error) => emit(
        ProductDetailsFailure(error: error.message),
      ),
      (productDetails) => emit(
        ProductDetailsLoaded(productDetails: productDetails),
      ),
    );
  }
}
