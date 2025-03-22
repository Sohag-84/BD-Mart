import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/home/domain/entity/category_entity.dart';
import 'package:gym_swat/features/home/domain/usecases/get_categories_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesUsecase getCategoriesUsecase;
  HomeBloc({required this.getCategoriesUsecase}) : super(HomeInitial()) {
    on<HomeCategoryFetchedEvent>((event, emit) async {
      try {
        emit(HomeCategoryLoading());
      final result = await getCategoriesUsecase(NoParams());
      result.fold(
        (failure) => emit(
          HomeCategoryLoadingFailure(message: failure.message),
        ),
        (categoryList) => emit(
          HomeCategoryLoaded(categoryList: categoryList),
        ),
      );
      }
      on SocketException{
        emit(const HomeCategoryLoadingFailure(message: "No internet connection"));
      }
       catch (e) {
        emit(HomeCategoryLoadingFailure(message: e.toString()));
      }
    });
  }
}
