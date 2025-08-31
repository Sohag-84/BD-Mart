import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/cart/domain/entity/cart_entity.dart';
import 'package:gym_swat/features/cart/domain/usecases/get_cart_items_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUsecase cartItemsUsecase;
  CartBloc({required this.cartItemsUsecase}) : super(CartInitial()) {
    on<FetchedCartItem>(_fetchedCartItem);
  }

  Future<void> _fetchedCartItem(
    FetchedCartItem event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    final result = await cartItemsUsecase.call(NoParams());

    result.fold(
      (error) => emit(CartFailure(error: error.message)),
      (cartItems) => emit(CartLoaded(cartItemList: cartItems)),
    );
  }
}
