import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_summary_entity.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';

class GetCartSummaryUsecase implements Usecase<CartSummaryEntity, NoParams> {
  final CartRepository cartRepository;
  const GetCartSummaryUsecase({required this.cartRepository});

  @override
  ResultFuture<CartSummaryEntity> call(NoParams params) async {
    return await cartRepository.getCartSummary();
  }
}
