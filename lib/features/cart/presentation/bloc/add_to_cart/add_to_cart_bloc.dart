import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/cart/domain/usecases/add_to_cart_usecase.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  final AddToCartUsecase addToCartUsecase;
  AddToCartBloc({required this.addToCartUsecase}) : super(AddToCartInitial()) {
    on<AddedToCart>(_addedToCart);
  }

  Future<void> _addedToCart(
    AddedToCart event,
    Emitter<AddToCartState> emit,
  ) async {
    emit(AddToCartLoading());
    final result = await addToCartUsecase.call(
      CartParams(
        productId: event.productId,
        variant: event.variant,
        color: event.color,
        quantity: event.quantity,
      ),
    );
    result.fold(
      (error) => emit(AddToCartFailure(error: error.message)),
      (success) => emit(AddToCartSuccess(message: success)),
    );
  }
}
