import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/enums/payment_method.dart';

part 'payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethod> {
  PaymentMethodCubit() : super(PaymentMethod.cashOnDelivery);

  void selectPayment({required PaymentMethod paymentMethod}) {
    emit(paymentMethod);
  }
}
