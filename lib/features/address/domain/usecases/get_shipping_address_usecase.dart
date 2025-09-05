import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/address/domain/entities/shipping_address_entity.dart';
import 'package:gym_swat/features/address/domain/repository/address_repository.dart';

class GetShippingAddressUsecase
    implements Usecase<List<ShippingAddressEntity>, NoParams> {
  final AddressRepository addressRepository;
  const GetShippingAddressUsecase({required this.addressRepository});

  @override
  ResultFuture<List<ShippingAddressEntity>> call(NoParams params) async {
    return await addressRepository.getShippingAddress();
  }
}
