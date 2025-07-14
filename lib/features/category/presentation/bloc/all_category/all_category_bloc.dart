import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/category/domain/entity/category_entity.dart';
import 'package:gym_swat/features/category/domain/usecase/category_usecase.dart';

part 'all_category_event.dart';
part 'all_category_state.dart';

class AllCategoryBloc extends Bloc<AllCategoryEvent, AllCategoryState> {
  final CategoryUsecase categoryUsecase;
  AllCategoryBloc({required this.categoryUsecase})
      : super(AllCategoryInitial()) {
    on<AllCategoryEvent>((event, emit) {});

    on<AllCategoryFetch>(_allCategoryFetch);
  }

  Future<void> _allCategoryFetch(
    AllCategoryFetch event,
    Emitter<AllCategoryState> emit,
  ) async {
    emit(AllCategoryLoading());
    
    final result = await categoryUsecase.call(
      CategoryParam(url: event.url),
    );

    result.fold(
      (l) => emit(AllCategoryFailure(error: l.message)),
      (categoryList) => emit(AllCategoryLoaded(categoryList: categoryList)),
    );
  }
}
