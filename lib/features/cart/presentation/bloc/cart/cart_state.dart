part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CartEntity> cartItemList;
  final bool isUpdating;
  const CartLoaded({required this.cartItemList, this.isUpdating = false});

  @override
  List<Object> get props => [cartItemList, isUpdating];
}

final class CartFailure extends CartState {
  final String error;
  const CartFailure({required this.error});

  @override
  List<Object> get props => [error];
}

//update cart item quantity
class CartQuantityUpdating extends CartState {
  final String productId;
  final int newQuantity;

  const CartQuantityUpdating(this.productId, this.newQuantity);

  @override
  List<Object> get props => [productId, newQuantity];
}

class CartQuantityUpdateFailure extends CartState {
  final String error;
  const CartQuantityUpdateFailure({required this.error});

  @override
  List<Object> get props => [error];
}

//delete cart Item
class CartItemDeleteSuccess extends CartState {}

class CartItemDeleteFailure extends CartState {
  final String error;
  const CartItemDeleteFailure({required this.error});

  @override
  List<Object> get props => [error];
}

//cart summary
class CartSummaryLoaded extends CartState {
  final CartSummaryEntity cartSummary;
  const CartSummaryLoaded({required this.cartSummary});

  @override
  List<Object> get props => [cartSummary];
}

class CartSummaryFailure extends CartState {
  final String error;
  const CartSummaryFailure({required this.error});

  @override
  List<Object> get props => [error];
}
