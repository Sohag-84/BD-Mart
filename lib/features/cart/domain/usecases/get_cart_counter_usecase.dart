import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_counter_entity.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';

class GetCartCounterUsecase implements Usecase<CartCounterEntity, NoParams> {
  final CartRepository cartRepository;
  const GetCartCounterUsecase({required this.cartRepository});

  @override
  ResultFuture<CartCounterEntity> call(NoParams params) async {
    return await cartRepository.getCartCounter();
  }
}
