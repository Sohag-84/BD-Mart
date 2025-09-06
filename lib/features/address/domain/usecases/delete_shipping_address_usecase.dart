import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/address/domain/repository/address_repository.dart';

class DeleteShippingAddressUsecase
    implements Usecase<String, DeleteAddressParams> {
  final AddressRepository addressRepository;
  const DeleteShippingAddressUsecase({required this.addressRepository});
  @override
  ResultFuture<String> call(DeleteAddressParams params) async {
    return await addressRepository.deleteShippingAddress(id: params.id);
  }
}

class DeleteAddressParams {
  final int id;
  const DeleteAddressParams({required this.id});
}
