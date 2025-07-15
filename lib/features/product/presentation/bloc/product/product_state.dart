part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductEntity> productList;
  final bool hasReachedMax;
  final bool isFetching;
  const ProductLoaded({
    required this.productList,
    required this.hasReachedMax,
    required this.isFetching,
  });
  @override
  List<Object> get props => [productList, hasReachedMax, isFetching];
}

final class ProductLoadingFailed extends ProductState {
  final String message;
  const ProductLoadingFailed({required this.message});
  @override
  List<Object> get props => [message];
}
