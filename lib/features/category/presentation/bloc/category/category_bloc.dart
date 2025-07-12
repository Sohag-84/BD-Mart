import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/usecase/category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUsecase categoryUsecase;

  CategoryBloc({required this.categoryUsecase}) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {});

    on<CategoryFetch>(_categoryFetched);
  }

  Future<void> _categoryFetched(
      CategoryFetch event, Emitter<CategoryState> emit) async {
    if (!event.forceToLoadData && state is CategoryLoaded) return;

    emit(CategoryLoading());

    final result = await categoryUsecase.call(CategoryParam(url: event.url));
    result.fold(
      (left) => emit(CategoryFailure(error: left.message)),
      (right) => emit(CategoryLoaded(categoryList: right)),
    );
  }

 
}
