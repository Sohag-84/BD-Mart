import 'package:gym_swat/core/entity/response_entity.dart';
import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/domain/repository/cart_repository.dart';

class CheckoutUsecase implements Usecase<ResponseEntity, CheckoutParams> {
  final CartRepository cartRepository;
  const CheckoutUsecase({required this.cartRepository});
  @override
  ResultFuture<ResponseEntity> call(CheckoutParams params) async {
    return await cartRepository.checkout(
      addressId: params.addressId,
      paymentType: params.paymentType,
    );
  }
}

class CheckoutParams {
  final String addressId;
  final String paymentType;

  CheckoutParams({
    required this.addressId,
    required this.paymentType,
  });
}
