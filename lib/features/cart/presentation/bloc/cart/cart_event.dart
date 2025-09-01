part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class FetchedCartItem extends CartEvent {}

final class UpdatedCartItem extends CartEvent {}

final class DeletedCartItem extends CartEvent {
  final String productId;
  const DeletedCartItem({required this.productId});

  @override
  List<Object> get props => [productId];
}
