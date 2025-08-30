import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/cart/domain/usecases/add_to_cart_usecase.dart';

part 'buy_now_event.dart';
part 'buy_now_state.dart';

class BuyNowBloc extends Bloc<BuyNowEvent, BuyNowState> {
  final AddToCartUsecase addToCartUsecase;
  BuyNowBloc({required this.addToCartUsecase}) : super(BuyNowInitial()) {
    on<AddedBuyNow>(_addedBuyNow);
  }

  Future<void> _addedBuyNow(
    AddedBuyNow event,
    Emitter<BuyNowState> emit,
  ) async {
    emit(BuyNowLoading());

    final result = await addToCartUsecase.call(
      CartParams(
        productId: event.productId,
        variant: event.variant,
        color: event.color,
        quantity: event.quantity,
      ),
    );
    result.fold(
      (error) => emit(BuyNowFailure(error: error.message)),
      (success) => emit(BuyNowSuccess(message: success)),
    );
  }
}
