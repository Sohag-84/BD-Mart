part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

final class ProductDetailsFetch extends ProductDetailsEvent {
  final String productId;
  const ProductDetailsFetch({required this.productId});

  @override
  List<Object> get props => [productId];
}
