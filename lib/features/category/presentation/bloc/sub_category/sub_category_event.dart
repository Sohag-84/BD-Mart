part of 'sub_category_bloc.dart';

sealed class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();

  @override
  List<Object> get props => [];
}

final class SubcategoryFetch extends SubCategoryEvent {
  final String url;
  final bool forceToLoadData;
  const SubcategoryFetch({required this.url, this.forceToLoadData = false});

  @override
  List<Object> get props => [url, forceToLoadData];
}
