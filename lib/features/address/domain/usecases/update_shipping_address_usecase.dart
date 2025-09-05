import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/address/domain/repository/address_repository.dart';

class UpdateShippingAddressUsecase
    implements Usecase<String, UpdateAddressParams> {
  final AddressRepository addressRepository;
  const UpdateShippingAddressUsecase({required this.addressRepository});
  @override
  ResultFuture<String> call(UpdateAddressParams params) async {
    return await addressRepository.updateShippingAddress(
      id: params.id,
      address: params.address,
      postalCode: params.postalCode,
      phoneNumber: params.phoneNumber,
      cityId: params.cityId,
      stateId: params.stateId,
    );
  }
}

class UpdateAddressParams {
  final int id;
  final String address;
  final String postalCode;
  final String phoneNumber;
  final int cityId;
  final int stateId;
  const UpdateAddressParams({
    required this.id,
    required this.address,
    required this.postalCode,
    required this.phoneNumber,
    required this.cityId,
    required this.stateId,
  });
}
