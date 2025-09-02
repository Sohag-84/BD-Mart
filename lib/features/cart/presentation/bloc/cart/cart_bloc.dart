import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/cart/domain/entity/cart_entity.dart';
import 'package:gym_swat/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:gym_swat/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:gym_swat/features/cart/domain/usecases/update_quantity_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUsecase cartItemsUsecase;
  final DeleteCartItemUsecase deleteCartItemUsecase;
  final UpdateQuantityUsecase updateQuantityUsecase;
  CartBloc({
    required this.cartItemsUsecase,
    required this.deleteCartItemUsecase,
    required this.updateQuantityUsecase,
  }) : super(CartInitial()) {
    on<FetchedCartItem>(_fetchedCartItem);
    on<DeletedCartItem>(_deletedCartItem);
    on<UpdateCartQuantity>(_updateCartQuantity);
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
      currentState = result.fold(
        (error) {
          emit(CartFailure(error: error.message));
          return null;
        },
        (cartItems) => currentState = CartLoaded(cartItemList: cartItems),
      );
    }

    if (currentState == null || currentState!.cartItemList.isEmpty) return;
    emit(CartLoaded(
      cartItemList: currentState!.cartItemList,
      isUpdating: true,
    ));
    final result = await deleteCartItemUsecase.call(
      ProductIdParam(productId: event.productId),
    );

    result.fold(
      (error) {
        emit(CartItemDeleteFailure(error: error.message));
        emit(CartLoaded(
          cartItemList: currentState!.cartItemList,
          isUpdating: false,
        ));
      },
      (message) {
        final updateList = currentState!.cartItemList.map((shop) {
          final updatedCartItems = shop.cartItems
              .where((item) => item.id.toString() != event.productId)
              .toList();
          return shop.copyWith(cartItems: updatedCartItems);
        }).toList();
        emit(CartLoaded(cartItemList: updateList, isUpdating: false));
      },
    );
  }

  //update cart quantity
  Future<void> _updateCartQuantity(
    UpdateCartQuantity event,
    Emitter<CartState> emit,
  ) async {
    // 1️⃣ Ensure cart is loaded
    CartLoaded? currentState;
    if (state is CartLoaded) {
      currentState = state as CartLoaded;
    } else {
      // If cart not loaded yet, fetch cart first
      final result = await cartItemsUsecase.call(NoParams());
      currentState = result.fold(
        (error) {
          emit(CartFailure(error: error.message));
          return null;
        },
        (cartItems) => CartLoaded(cartItemList: cartItems),
      );
    }

    if (currentState == null || currentState.cartItemList.isEmpty) return;

    // 2️⃣ Emit updating state
    emit(CartLoaded(
      cartItemList: currentState.cartItemList,
      isUpdating: true,
    ));

    // 3️⃣ Call API to update quantity
    final result = await updateQuantityUsecase.call(
      UpdateQuantityParams(
        productId: event.productId,
        quantity: event.newQuantity.toString(),
      ),
    );

    // 4️⃣ Update state after API
    result.fold(
      (error) {
        emit(CartQuantityUpdateFailure(error: error.message));
        // reset updating flag
        emit(CartLoaded(
          cartItemList: currentState!.cartItemList,
          isUpdating: false,
        ));
      },
      (_) {
        final updatedList = currentState!.cartItemList.map((shop) {
          final updatedItems = shop.cartItems.map((item) {
            if (item.id.toString() == event.productId) {
              return item.copyWith(quantity: event.newQuantity);
            }
            return item;
          }).toList();
          return shop.copyWith(cartItems: updatedItems);
        }).toList();

        emit(CartLoaded(cartItemList: updatedList, isUpdating: false));
      },
    );
  }
}
