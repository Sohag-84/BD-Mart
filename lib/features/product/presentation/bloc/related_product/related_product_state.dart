part of 'related_product_bloc.dart';

sealed class RelatedProductState extends Equatable {
  const RelatedProductState();

  @override
  List<Object> get props => [];
}

final class RelatedProductInitial extends RelatedProductState {}

final class RelatedProductLoading extends RelatedProductState {}

final class RelatedProductLoaded extends RelatedProductState {
  final List<ProductEntity> productList;
  const RelatedProductLoaded({required this.productList});

  @override
  List<Object> get props => [productList];
}

final class RelatedProductFailure extends RelatedProductState {
  final String error;
  const RelatedProductFailure({required this.error});

  @override
  List<Object> get props => [error];
}
