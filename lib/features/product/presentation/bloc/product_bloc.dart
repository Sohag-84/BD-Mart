import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/product/data/models/product_model.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUsecase getProductUsecase;
  ProductBloc({required this.getProductUsecase}) : super(ProductInitial()) {
    on<ProductFetchedEvent>(_productFetchedEvent);
  }

  FutureOr<void> _productFetchedEvent(
      ProductFetchedEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final result = await getProductUsecase(NoParams());
      result.fold(
        (failure) => emit(
          ProductLoadingFailed(message: failure.message),
        ),
        (products) => emit(ProductLoaded(productList: products)),
      );
    } on SocketException {
      emit(const ProductLoadingFailed(message: "No internet connection"));
    } catch (e) {
      emit(ProductLoadingFailed(message: e.toString()));
    }
  }
}
