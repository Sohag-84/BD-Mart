part of 'search_suggetion_bloc.dart';

sealed class SearchSuggetionEvent extends Equatable {
  const SearchSuggetionEvent();

  @override
  List<Object> get props => [];
}

final class FetchedSearchSuggetions extends SearchSuggetionEvent {
  final String query;
  const FetchedSearchSuggetions({required this.query});

  @override
  List<Object> get props => [query];
}
