import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/usecase/category_usecase.dart';

part 'feature_category_event.dart';
part 'feature_category_state.dart';

class FeatureCategoryBloc
    extends Bloc<FeatureCategoryEvent, FeatureCategoryState> {
  final CategoryUsecase categoryUsecase;
  FeatureCategoryBloc({required this.categoryUsecase})
      : super(FeatureCategoryInitial()) {
    on<FeatureCategoryEvent>((event, emit) {});

    on<FeatureCategoryFetch>(_featureCategoryFetch);
  }

  Future<void> _featureCategoryFetch(
      FeatureCategoryFetch event, Emitter<FeatureCategoryState> emit) async {
    if (!event.forceToLoadData && state is FeatureCategoryLoaded) return;

    emit(FeatureCategoryLoading());

    final result = await categoryUsecase.call(CategoryParam(url: event.url));
    result.fold(
      (left) => emit(FeatureCategoryFailure(error: left.message)),
      (right) => emit(FeatureCategoryLoaded(featureCategoryList: right)),
    );
  }
}
