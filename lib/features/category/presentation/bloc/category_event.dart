part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryFetch extends CategoryEvent {
  final bool forceToLoadData;
  const CategoryFetch({this.forceToLoadData = false});

  @override
  List<Object> get props => [forceToLoadData];
}
