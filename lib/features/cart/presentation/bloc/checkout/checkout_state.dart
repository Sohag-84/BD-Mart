part of 'checkout_bloc.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {
  final ResponseEntity response;
  const CheckoutSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class CheckoutFailed extends CheckoutState {
  final String error;
  const CheckoutFailed({required this.error});
  @override
  List<Object> get props => [error];
}
