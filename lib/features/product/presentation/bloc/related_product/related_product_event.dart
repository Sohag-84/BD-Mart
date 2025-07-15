part of 'related_product_bloc.dart';

sealed class RelatedProductEvent extends Equatable {
  const RelatedProductEvent();

  @override
  List<Object> get props => [];
}

final class RelatedProductFetch extends RelatedProductEvent {
  final String productId;
  const RelatedProductFetch({required this.productId});

  @override
  List<Object> get props => [productId];
}
