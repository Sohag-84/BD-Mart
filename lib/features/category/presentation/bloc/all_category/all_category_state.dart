part of 'all_category_bloc.dart';

sealed class AllCategoryState extends Equatable {
  const AllCategoryState();

  @override
  List<Object> get props => [];
}

final class AllCategoryInitial extends AllCategoryState {}

final class AllCategoryLoading extends AllCategoryState {}

final class AllCategoryLoaded extends AllCategoryState {
  final List<CategoryEntity> categoryList;
  const AllCategoryLoaded({required this.categoryList});
}

final class AllCategoryFailure extends AllCategoryState {
  final String error;
  const AllCategoryFailure({required this.error});

  @override
  List<Object> get props => [error];
}
