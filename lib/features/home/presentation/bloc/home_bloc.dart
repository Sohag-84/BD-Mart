import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/home/domain/entity/slider_entity.dart';
import 'package:gym_swat/features/home/domain/usecases/get_sliders_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSlidersUsecase getSlidersUsecase;
  HomeBloc({
    required this.getSlidersUsecase,
  }) : super(HomeInitial()) {
    on<HomeSliderFetchedEvent>(_homeSliderFetchedEvent);
  }

  FutureOr<void> _homeSliderFetchedEvent(
    HomeSliderFetchedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeSliderLoading());
    final result = await getSlidersUsecase(NoParams());
    result.fold(
      (failure) => emit(
        HomeSliderLoadingError(message: failure.message),
      ),
      (sliders) => emit(HomeSliderLoaded(sliderList: sliders)),
    );
  }
}
