part of 'all_category_bloc.dart';

sealed class AllCategoryEvent extends Equatable {
  const AllCategoryEvent();

  @override
  List<Object> get props => [];
}

final class AllCategoryFetch extends AllCategoryEvent {
  final String url;
  const AllCategoryFetch({required this.url});

  @override
  List<Object> get props => [url];
}
