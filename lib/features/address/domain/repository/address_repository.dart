import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/address/domain/entities/shipping_address_entity.dart';

abstract interface class AddressRepository {
  ResultFuture<String> addShippingAddress({
    required String address,
    required String postalCode,
    required String phoneNumber,
    required int cityId,
    required int stateId,
  });

  ResultFuture<String> updateShippingAddress({
    required int id,
    required String address,
    required String postalCode,
    required String phoneNumber,
    required int cityId,
    required int stateId,
  });

  ResultFuture<List<ShippingAddressEntity>> getShippingAddress();
}
