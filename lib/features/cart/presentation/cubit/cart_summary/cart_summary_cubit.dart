import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_summary_entity.dart';
import 'package:gym_swat/features/cart/domain/usecases/get_cart_summary_usecase.dart';

part 'cart_summary_state.dart';

class CartSummaryCubit extends Cubit<CartSummaryState> {
  final GetCartSummaryUsecase cartSummaryUsecase;
  CartSummaryCubit({required this.cartSummaryUsecase})
      : super(CartSummaryInitial());

  Future<void> fetchedCartSummary() async {
    final result = await cartSummaryUsecase.call(NoParams());

    result.fold(
      (error) => emit(CartSummaryFailure(error: error.message)),
      (summary) => emit(
        CartSummaryLoaded(cartSummary: summary),
      ),
    );
  }
}
