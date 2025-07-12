part of 'feature_category_bloc.dart';

sealed class FeatureCategoryState extends Equatable {
  const FeatureCategoryState();

  @override
  List<Object> get props => [];
}

final class FeatureCategoryInitial extends FeatureCategoryState {}

final class FeatureCategoryLoading extends FeatureCategoryState {}

final class FeatureCategoryLoaded extends FeatureCategoryState {
  final List<CategoryEntity> featureCategoryList;
  const FeatureCategoryLoaded({required this.featureCategoryList});

  @override
  List<Object> get props => [featureCategoryList];
}

final class FeatureCategoryFailure extends FeatureCategoryState {
  final String error;
  const FeatureCategoryFailure({required this.error});

  @override
  List<Object> get props => [error];
}
