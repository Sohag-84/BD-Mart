part of 'search_product_bloc.dart';

sealed class SearchProductState extends Equatable {
  const SearchProductState();

  @override
  List<Object> get props => [];
}

final class SearchProductInitial extends SearchProductState {}

final class SearchProductLoading extends SearchProductState {}

final class SearchProductLoaded extends SearchProductState {
  final List<ProductEntity> products;
  final bool hasReachedMax;
  final bool isFetching;
  const SearchProductLoaded({
    required this.products,
    required this.hasReachedMax,
    required this.isFetching,
  });

  @override
  List<Object> get props => [products, hasReachedMax, isFetching];
}

final class SearchProductFailure extends SearchProductState {
  final String error;
  const SearchProductFailure({required this.error});

  @override
  List<Object> get props => [error];
}
