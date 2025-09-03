part of 'cart_counter_cubit.dart';

sealed class CartCounterState extends Equatable {
  const CartCounterState();

  @override
  List<Object> get props => [];
}

final class CartCounterInitial extends CartCounterState {}

final class CartCounterLoaded extends CartCounterState {
  final CartCounterEntity counterEntity;
  const CartCounterLoaded({required this.counterEntity});
  @override
  List<Object> get props => [counterEntity];
}

final class CartCounterFailure extends CartCounterState {
  final String error;
  const CartCounterFailure({required this.error});
  @override
  List<Object> get props => [error];
}
