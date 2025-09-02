part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class FetchedCartItem extends CartEvent {}

class UpdateCartQuantity extends CartEvent {
  final String productId;
  final int newQuantity;

  const UpdateCartQuantity({
    required this.productId,
    required this.newQuantity,
  });

  @override
  List<Object> get props => [productId, newQuantity];
}

final class DeletedCartItem extends CartEvent {
  final String productId;
  const DeletedCartItem({required this.productId});

  @override
  List<Object> get props => [productId];
}
