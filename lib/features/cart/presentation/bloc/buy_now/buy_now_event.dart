part of 'buy_now_bloc.dart';

sealed class BuyNowEvent extends Equatable {
  const BuyNowEvent();

  @override
  List<Object> get props => [];
}

final class AddedBuyNow extends BuyNowEvent {
  final String productId, variant, color, quantity;
  const AddedBuyNow({
    required this.productId,
    required this.variant,
    required this.color,
    required this.quantity,
  });

  @override
  List<Object> get props => [productId, variant, color, quantity];
}
