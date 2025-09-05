class ShippingAddressEntity {
  final List<AddressEntity> data;
  final bool? success;
  final int? status;

  const ShippingAddressEntity({
    required this.data,
    this.success,
    this.status,
  });

  ShippingAddressEntity copyWith({
    List<AddressEntity>? data,
    bool? success,
    int? status,
  }) {
    return ShippingAddressEntity(
      data: data ?? this.data,
      success: success ?? this.success,
      status: status ?? this.status,
    );
  }
}

class AddressEntity {
  final int? id;
  final int? userId;
  final String? address;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? countryName;
  final String? stateName;
  final String? cityName;
  final String? postalCode;
  final String? phone;
  final int? setDefault;
  final bool? locationAvailable;
  final double? lat;
  final double? lang;

  const AddressEntity({
    this.id,
    this.userId,
    this.address,
    this.countryId,
    this.stateId,
    this.cityId,
    this.countryName,
    this.stateName,
    this.cityName,
    this.postalCode,
    this.phone,
    this.setDefault,
    this.locationAvailable,
    this.lat,
    this.lang,
  });

  AddressEntity copyWith({
    int? id,
    int? userId,
    String? address,
    int? countryId,
    int? stateId,
    int? cityId,
    String? countryName,
    String? stateName,
    String? cityName,
    String? postalCode,
    String? phone,
    int? setDefault,
    bool? locationAvailable,
    double? lat,
    double? lang,
  }) {
    return AddressEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      address: address ?? this.address,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      cityId: cityId ?? this.cityId,
      countryName: countryName ?? this.countryName,
      stateName: stateName ?? this.stateName,
      cityName: cityName ?? this.cityName,
      postalCode: postalCode ?? this.postalCode,
      phone: phone ?? this.phone,
      setDefault: setDefault ?? this.setDefault,
      locationAvailable: locationAvailable ?? this.locationAvailable,
      lat: lat ?? this.lat,
      lang: lang ?? this.lang,
    );
  }
}
