import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';

class DeleteCartItemUsecase implements Usecase<void, ProductIdParam> {
  final CartRepository cartRepository;
  const DeleteCartItemUsecase({required this.cartRepository});

  @override
  ResultFuture<void> call(ProductIdParam params) async {
    return await cartRepository.deleteCartItem(productId: params.productId);
  }
}

class ProductIdParam {
  final String productId;
  const ProductIdParam({required this.productId});
}
