import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';

class UpdateQuantityUsecase implements Usecase<void, UpdateQuantityParams> {
  final CartRepository cartRepository;
  const UpdateQuantityUsecase({required this.cartRepository});

  @override
  ResultFuture<void> call(UpdateQuantityParams params) async {
    return await cartRepository.updateCartQuantity(
        productId: params.productId, quantity: params.quantity);
  }
}

class UpdateQuantityParams {
  final String productId;
  final String quantity;

  const UpdateQuantityParams({required this.productId, required this.quantity});
}
