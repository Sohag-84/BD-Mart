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
  const CartLoaded({required this.cartItemList});

  @override
  List<Object> get props => [cartItemList];
}

final class CartFailure extends CartState {
  final String error;
  const CartFailure({required this.error});

  @override
  List<Object> get props => [error];
}

//update cart item quantity
final class CartItemUpdate extends CartState {}

//delete cart Item
class CartItemDeleteSuccess extends CartState {}

class CartItemDeleteLoading extends CartState{}

class CartItemDeleteFailure extends CartState {
  final String error;
  const CartItemDeleteFailure({required this.error});

  @override
  List<Object> get props => [error];
}
