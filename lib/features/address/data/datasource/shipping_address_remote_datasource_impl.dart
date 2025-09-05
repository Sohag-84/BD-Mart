import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/features/address/data/datasource/shipping_address_remote_datasource.dart';
import 'package:gym_swat/features/address/data/models/shipping_address_model.dart';

class ShippingAddressRemoteDatasourceImpl
    implements ShippingAddressRemoteDatasource {
  final ApiServices apiServices;
  const ShippingAddressRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<String> addShippingAddress({
    required String address,
    required String postalCode,
    required String phoneNumber,
    required int cityId,
    required int stateId,
  }) async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.addShippingAddrss,
      isEncodedData: true,
      requiresToken: true,
      body: {
        "user_id": LocalPreferenceService.instance.getUserId(),
        "address": address,
        "country_id": 18,
        "city_id": cityId,
        "state_id": stateId,
        "postal_code": postalCode,
        "phone": phoneNumber,
      },
    );
    return response["message"];
  }

  @override
  Future<List<ShippingAddressModel>> getShippingAddress() async {
    final userId = LocalPreferenceService.instance.getUserId();
    var response = await apiServices.getApi(
      endPoint: "${AppConfig.getShippingAddress}$userId",
      requiresToken: true,
    );
    if (response['data'] != null) {
      final List<dynamic> address = response['data'];
      return address
          .map((json) => ShippingAddressModel.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<String> updateShippingAddress({
    required int id,
    required String address,
    required String postalCode,
    required String phoneNumber,
    required int cityId,
    required int stateId,
  }) async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.updateShippingAddrss,
      isEncodedData: true,
      requiresToken: true,
      body: {
        "id": id,
        "address": address,
        "country_id": 18,
        "city_id": cityId,
        "state_id": stateId,
        "postal_code": postalCode,
        "phone": phoneNumber,
      },
    );
    return response['message'];
  }
}
