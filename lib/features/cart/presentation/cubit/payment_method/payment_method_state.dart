part of 'payment_method_cubit.dart';

sealed class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

final class PaymentMethodInitial extends PaymentMethodState {}
