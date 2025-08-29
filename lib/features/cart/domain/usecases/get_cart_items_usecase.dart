import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/domain/entity/cart_entity.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';

class GetCartItemsUsecase implements Usecase<List<CartEntity>, NoParams> {
  final CartRepository cartRepository;
  const GetCartItemsUsecase({required this.cartRepository});

  @override
  ResultFuture<List<CartEntity>> call(NoParams params) async {
    return await cartRepository.getCartItems();
  }
}
