part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryFetch extends CategoryEvent {
  final String url;
  final bool forceToLoadData;
  const CategoryFetch({required this.url, this.forceToLoadData = false});

  @override
  List<Object> get props => [url, forceToLoadData];
}

