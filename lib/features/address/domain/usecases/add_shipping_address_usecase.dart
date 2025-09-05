import 'package:gym_swat/core/usecase/usecase.dart';
import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/address/domain/repository/address_repository.dart';

class AddShippingAddressUsecase implements Usecase<String, AddAddressParams> {
  final AddressRepository addressRepository;
  const AddShippingAddressUsecase({required this.addressRepository});
  @override
  ResultFuture<String> call(AddAddressParams params) async {
    return await addressRepository.addShippingAddress(
      address: params.address,
      postalCode: params.postalCode,
      phoneNumber: params.phoneNumber,
      cityId: params.cityId,
      stateId: params.stateId,
    );
  }
}

class AddAddressParams {
  final String address;
  final String postalCode;
  final String phoneNumber;
  final int cityId;
  final int stateId;
  const AddAddressParams({
    required this.address,
    required this.postalCode,
    required this.phoneNumber,
    required this.cityId,
    required this.stateId,
  });
}
