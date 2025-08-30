part of 'add_to_cart_bloc.dart';

sealed class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

final class AddedToCart extends AddToCartEvent {
  final String productId, variant, color, quantity;
  const AddedToCart({
    required this.productId,
    required this.variant,
    required this.color,
    required this.quantity,
  });

  @override
  List<Object> get props => [productId, variant, color, quantity];
}
