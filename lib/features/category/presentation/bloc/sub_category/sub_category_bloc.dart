import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/usecase/category_usecase.dart';

part 'sub_category_event.dart';
part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  final CategoryUsecase categoryUsecase;
  SubCategoryBloc({required this.categoryUsecase})
      : super(SubCategoryInitial()) {
    on<SubCategoryEvent>((event, emit) {});

    on<SubcategoryFetch>(_subcategoryFetch);
  }

  Future<void> _subcategoryFetch(
      SubcategoryFetch event, Emitter<SubCategoryState> emit) async {
    if (!event.forceToLoadData && state is SubCategoryLoaded) return;

    emit(SubCategoryLoading());

    final result = await categoryUsecase.call(CategoryParam(url: event.url));
    result.fold(
      (left) => emit(SubCategoryFailure(error: left.message)),
      (right) => emit(SubCategoryLoaded(subcategoryList: right)),
    );
  }
}
