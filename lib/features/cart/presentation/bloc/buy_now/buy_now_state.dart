part of 'buy_now_bloc.dart';

sealed class BuyNowState extends Equatable {
  const BuyNowState();

  @override
  List<Object> get props => [];
}

final class BuyNowInitial extends BuyNowState {}

final class BuyNowLoading extends BuyNowState {}

final class BuyNowSuccess extends BuyNowState {
  final String message;
  const BuyNowSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class BuyNowFailure extends BuyNowState {
  final String error;
  const BuyNowFailure({required this.error});
  @override
  List<Object> get props => [error];
}
