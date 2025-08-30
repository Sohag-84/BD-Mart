part of 'add_to_cart_bloc.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState {
  final String message;
  const AddToCartSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddToCartFailure extends AddToCartState {
  final String error;
  const AddToCartFailure({required this.error});
  @override
  List<Object> get props => [error];
}
