import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/entity/response_entity.dart';
import 'package:gym_swat/features/cart/domain/usecases/checkout_usecase.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutUsecase checkoutUsecase;

  CheckoutBloc({required this.checkoutUsecase}) : super(CheckoutInitial()) {
    on<CheckoutOrder>(_checkoutOrder);
  }

  Future<void> _checkoutOrder(
    CheckoutOrder event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(CheckoutLoading());
    final result = await checkoutUsecase.call(
      CheckoutParams(
        addressId: event.addressId,
        paymentType: event.paymentType,
      ),
    );

    result.fold(
      (error) => emit(CheckoutFailed(error: error.message)),
      (response) => emit(
        CheckoutSuccess(response: response),
      ),
    );
  }
}
