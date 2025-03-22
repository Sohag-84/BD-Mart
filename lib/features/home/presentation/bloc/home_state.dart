part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeCategoryLoading extends HomeState {}

final class HomeCategoryLoaded extends HomeState {
  final List<CategoryEntity> categoryList;
  const HomeCategoryLoaded({required this.categoryList});

  @override
  List<Object> get props => [categoryList];
}

final class HomeCategoryLoadingFailure extends HomeState {
  final String message;
  const HomeCategoryLoadingFailure({required this.message});

  @override
  List<Object> get props => [message];
}
