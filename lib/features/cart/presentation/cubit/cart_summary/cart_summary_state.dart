part of 'cart_summary_cubit.dart';

sealed class CartSummaryState extends Equatable {
  const CartSummaryState();

  @override
  List<Object> get props => [];
}

final class CartSummaryInitial extends CartSummaryState {}

//cart summary
class CartSummaryLoaded extends CartSummaryState {
  final CartSummaryEntity cartSummary;
  const CartSummaryLoaded({required this.cartSummary});

  @override
  List<Object> get props => [cartSummary];
}

class CartSummaryFailure extends CartSummaryState {
  final String error;
  const CartSummaryFailure({required this.error});

  @override
  List<Object> get props => [error];
}
