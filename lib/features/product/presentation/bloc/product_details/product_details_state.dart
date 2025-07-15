part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final List<ProductDetailsEntity> productDetails;
  const ProductDetailsLoaded({
    required this.productDetails,
  });
  @override
  List<Object> get props => [productDetails];
}

final class ProductDetailsFailure extends ProductDetailsState {
  final String error;
  const ProductDetailsFailure({required this.error});
  @override
  List<Object> get props => [error];
}
