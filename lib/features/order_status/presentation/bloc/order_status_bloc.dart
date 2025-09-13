import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/features/order_status/data/models/order_model.dart';
import 'package:gym_swat/features/order_status/domain/usecases/get_all_order_usecase.dart';

part 'order_status_event.dart';
part 'order_status_state.dart';

class OrderStatusBloc extends Bloc<OrderStatusEvent, OrderStatusState> {
  final GetAllOrderUsecase allOrderUsecase;

  OrderStatusBloc({
    required this.allOrderUsecase,
  }) : super(OrderStatusInitial()) {
    on<FetchedAllOrder>(_fetchedAllOrder);
  }

  FutureOr<void> _fetchedAllOrder(
    FetchedAllOrder event,
    Emitter<OrderStatusState> emit,
  ) async {
    emit(AllOrderLoading());

    final result = await allOrderUsecase.call(
      AllOrderParams(
        page: event.page,
        paymentStatus: null,
        deliveryStatus: null,
      ),
    );

    result.fold(
      (error) => emit(
        AllOrderFailure(error: error.message),
      ),
      (orderList) => emit(
        AllOrderLoaded(orderList: orderList),
      ),
    );
  }
}
