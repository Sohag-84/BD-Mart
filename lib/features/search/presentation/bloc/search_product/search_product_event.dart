part of 'search_product_bloc.dart';

sealed class SearchProductEvent extends Equatable {
  const SearchProductEvent();

  @override
  List<Object> get props => [];
}

final class FetchedSearchProduct extends SearchProductEvent {
  final String query;
  final bool isRefresh;
  const FetchedSearchProduct({
    required this.query,
    this.isRefresh = false,
  });

  @override
  List<Object> get props => [query, isRefresh];
}
