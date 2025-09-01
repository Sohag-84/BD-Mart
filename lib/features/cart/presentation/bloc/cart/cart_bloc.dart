import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/cart/domain/entity/cart_entity.dart';
import 'package:gym_swat/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:gym_swat/features/cart/domain/usecases/get_cart_items_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUsecase cartItemsUsecase;
  final DeleteCartItemUsecase deleteCartItemUsecase;
  CartBloc({
    required this.cartItemsUsecase,
    required this.deleteCartItemUsecase,
  }) : super(CartInitial()) {
    on<FetchedCartItem>(_fetchedCartItem);
    on<DeletedCartItem>(_deletedCartItem);
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

  Future<void> _deletedCartItem(
    DeletedCartItem event,
    Emitter<CartState> emit,
  ) async {
    CartLoaded? currentState;

    // Wait until state is CartLoaded
    if (state is CartLoaded) {
      currentState = state as CartLoaded;
    } else {
      // if porduct is not loaded, first load the cart product
      final result = await cartItemsUsecase.call(NoParams());
      result.fold(
        (error) => emit(CartFailure(error: error.message)),
        (cartItems) => currentState = CartLoaded(cartItemList: cartItems),
      );
    }

    if (currentState == null) return;

    final result = await deleteCartItemUsecase.call(
      ProductIdParam(productId: event.productId),
    );

    result.fold(
      (error) => emit(CartItemDeleteFailure(error: error.message)),
      (message) {
        final updateList = currentState!.cartItemList.map((shop) {
          final updatedCartItems = shop.cartItems
              .where((item) => item.id.toString() != event.productId)
              .toList();
          return shop.copyWith(cartItems: updatedCartItems);
        }).toList();
        emit(CartItemDeleteSuccess());
        emit(CartLoaded(cartItemList: updateList));
      },
    );
  }
}
