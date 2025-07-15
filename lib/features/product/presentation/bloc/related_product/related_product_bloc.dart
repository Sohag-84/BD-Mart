import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/product/domain/entity/product_entity.dart';
import 'package:gym_swat/features/product/domain/usecases/get_related_product_usecase.dart';

part 'related_product_event.dart';
part 'related_product_state.dart';

class RelatedProductBloc
    extends Bloc<RelatedProductEvent, RelatedProductState> {
  final GetRelatedProductUsecase relatedProductUsecase;

  RelatedProductBloc({required this.relatedProductUsecase})
      : super(RelatedProductInitial()) {
    on<RelatedProductEvent>((event, emit) {});

    on<RelatedProductFetch>(_relatedProductFetch);
  }

  Future<void> _relatedProductFetch(
    RelatedProductFetch event,
    Emitter<RelatedProductState> emit,
  ) async {
    emit(RelatedProductLoading());

    final result = await relatedProductUsecase
        .call(ProductIdParam(productId: event.productId));

    result.fold(
      (error) => emit(
        RelatedProductFailure(error: error.message),
      ),
      (products) => emit(
        RelatedProductLoaded(productList: products),
      ),
    );
  }
}
