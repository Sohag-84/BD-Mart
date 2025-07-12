part of 'feature_category_bloc.dart';

sealed class FeatureCategoryEvent extends Equatable {
  const FeatureCategoryEvent();

  @override
  List<Object> get props => [];
}

class FeatureCategoryFetch extends FeatureCategoryEvent {
  final String url;
  final bool forceToLoadData;
  const FeatureCategoryFetch({
    required this.url,
    this.forceToLoadData = false,
  });

  @override
  List<Object> get props => [url, forceToLoadData];
}
