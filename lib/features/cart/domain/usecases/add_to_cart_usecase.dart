import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';

class AddToCartUsecase implements Usecase<String, CartParams> {
  final CartRepository cartRepository;
  const AddToCartUsecase({required this.cartRepository});

  @override
  ResultFuture<String> call(CartParams params) async {
    return await cartRepository.addToCart(
      productId: params.productId,
      variant: params.variant,
      color: params.color,
      quantity: params.quantity,
    );
  }
}

class CartParams {
  final String productId;
  final String variant;
  final String color;
  final String quantity;

  const CartParams({
    required this.productId,
    required this.variant,
    required this.color,
    required this.quantity,
  });
}
