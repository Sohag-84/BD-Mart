import 'package:gym_swat/features/address/data/models/shipping_address_model.dart';

abstract interface class ShippingAddressRemoteDatasource {
  Future<String> addShippingAddress({
    required String address,
    required String postalCode,
    required String phoneNumber,
    required int cityId,
    required int stateId,
  });

  Future<List<AddressModel>> getShippingAddress();

  Future<String> updateShippingAddress({
    required int id,
    required String address,
    required String postalCode,
    required String phoneNumber,
    required int cityId,
    required int stateId,
  });

  Future<String> deleteShippingAddress({required int id});
}
