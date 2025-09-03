import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_counter_entity.dart';
import 'package:gym_swat/features/cart/domain/usecases/get_cart_counter_usecase.dart';

part 'cart_counter_state.dart';

class CartCounterCubit extends Cubit<CartCounterState> {
  final GetCartCounterUsecase cartCounterUsecase;
  CartCounterCubit({required this.cartCounterUsecase})
      : super(
          CartCounterInitial(),
        );

  void cartCounter() async {
    final result = await cartCounterUsecase.call(NoParams());

    result.fold(
      (error) => emit(CartCounterFailure(error: error.message)),
      (counter) => emit(
        CartCounterLoaded(counterEntity: counter),
      ),
    );
  }
}
