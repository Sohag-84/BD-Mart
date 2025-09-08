part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

final class CheckoutOrder extends CheckoutEvent {
  final String addressId;
  final String paymentType;
  const CheckoutOrder({
    required this.addressId,
    required this.paymentType,
  });

  @override
  List<Object> get props => [addressId, paymentType];
}
