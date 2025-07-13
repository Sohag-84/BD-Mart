part of 'sub_category_bloc.dart';

sealed class SubCategoryState extends Equatable {
  const SubCategoryState();

  @override
  List<Object> get props => [];
}

final class SubCategoryInitial extends SubCategoryState {}

final class SubCategoryLoading extends SubCategoryState {}

final class SubCategoryLoaded extends SubCategoryState {
  final List<CategoryEntity> subcategoryList;
  const SubCategoryLoaded({required this.subcategoryList});

  @override
  List<Object> get props => [subcategoryList];
}

final class SubCategoryFailure extends SubCategoryState {
  final String error;
  const SubCategoryFailure({required this.error});

  @override
  List<Object> get props => [error];
}
