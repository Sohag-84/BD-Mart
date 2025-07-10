part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

///home category
final class HomeCategoryLoading extends HomeState {}

final class HomeCategoryLoaded extends HomeState {
  final List<HomeCategoryEntity> categoryList;
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

///home slider
final class HomeSliderLoading extends HomeState {}

final class HomeSliderLoaded extends HomeState {
  final List<SliderEntity> sliderList;
  const HomeSliderLoaded({required this.sliderList});

  @override
  List<Object> get props => [sliderList];
}

final class HomeSliderLoadingError extends HomeState {
  final String message;
  const HomeSliderLoadingError({required this.message});
  @override
  List<Object> get props => [message];
}
