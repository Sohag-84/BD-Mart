part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categoryList;
  const CategoryLoaded({required this.categoryList});

  @override
  List<Object> get props => [categoryList];
}

final class CategoryFailure extends CategoryState {
  final String error;
  const CategoryFailure({required this.error});

  @override
  List<Object> get props => [error];
}
