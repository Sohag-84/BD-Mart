import 'package:gym_swat/features/address/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel extends ShippingAddressEntity {
  const ShippingAddressModel({
    required List<AddressModel> super.data,
    super.success,
    super.status,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      data: json["data"] == null
          ? []
          : List<AddressModel>.from(
              json["data"].map((x) => AddressModel.fromJson(x))),
      success: json["success"],
      status: json["status"],
    );
  }
}

class AddressModel extends AddressEntity {
  const AddressModel({
    super.id,
    super.userId,
    super.address,
    super.countryId,
    super.stateId,
    super.cityId,
    super.countryName,
    super.stateName,
    super.cityName,
    super.postalCode,
    super.phone,
    super.setDefault,
    super.locationAvailable,
    super.lat,
    super.lang,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json["id"],
      userId: json["user_id"],
      address: json["address"],
      countryId: json["country_id"],
      stateId: json["state_id"],
      cityId: json["city_id"],
      countryName: json["country_name"],
      stateName: json["state_name"],
      cityName: json["city_name"],
      postalCode: json["postal_code"],
      phone: json["phone"],
      setDefault: json["set_default"],
      locationAvailable: json["location_available"],
      lat: (json["lat"] as num?)?.toDouble(),
      lang: (json["lang"] as num?)?.toDouble(),
    );
  }
}
