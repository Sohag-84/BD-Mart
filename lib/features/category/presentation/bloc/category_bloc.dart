import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/usecase/category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUsecase categoryUsecase;

  CategoryBloc({required this.categoryUsecase}) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {});

    on<CategoryFetched>(_categoryFetched);
  }

  FutureOr<void> _categoryFetched(
      CategoryFetched event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoading());

      final result = await categoryUsecase.call(NoParams());
      result.fold(
        (left) => emit(CategoryFailure(error: left.message)),
        (right) => emit(CategoryLoaded(categoryList: right)),
      );
      
    } catch (e) {
      emit(CategoryFailure(error: e.toString()));
    }
  }
}
