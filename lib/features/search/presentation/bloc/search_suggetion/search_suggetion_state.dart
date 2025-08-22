part of 'search_suggetion_bloc.dart';

sealed class SearchSuggetionState extends Equatable {
  const SearchSuggetionState();

  @override
  List<Object> get props => [];
}

final class SearchSuggetionInitial extends SearchSuggetionState {}

final class SearchSuggetionLoading extends SearchSuggetionState {}

final class SearchSuggetionLoaded extends SearchSuggetionState {
  final List<SearchSuggetionsEntity> suggetions;
  const SearchSuggetionLoaded({required this.suggetions});

  @override
  List<Object> get props => [suggetions];
}

final class SearchSuggetionFailure extends SearchSuggetionState {
  final String error;
  const SearchSuggetionFailure({required this.error});

  @override
  List<Object> get props => [error];
}
