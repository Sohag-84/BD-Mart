import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/services/api_services.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:gym_swat/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:gym_swat/features/cart/data/models/cart_counter_model.dart';
import 'package:gym_swat/features/cart/data/models/cart_model.dart';
import 'package:gym_swat/features/cart/data/models/cart_summary_model.dart';

class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  final ApiServices apiServices;
  const CartRemoteDatasourceImpl({required this.apiServices});

  @override
  Future<String> addToCart({
    required String productId,
    required String variant,
    required String color,
    required String quantity,
  }) async {
    Map<String, dynamic> bodyData = {
      "id": productId,
      "variant": variant,
      "color": color,
      "user_id": LocalPreferenceService.instance.getUserId(),
      "quantity": quantity,
    };
    final response = await apiServices.postApi(
      endPoint: AppConfig.addToCart,
      isEncodedData: true,
      requiresToken: true,
      body: bodyData,
    );
    return response['message'];
  }

  @override
  Future<void> deleteCartItem({required String productId}) async {
    final response = await apiServices.getApi(
      fullApiUrl: "${AppConfig.deleteCartItem}$productId",
      requiresToken: true,
    );
    return response;
  }

  @override
  Future<List<CartModel>> getCartItems() async {
    final response = await apiServices.postApi(
      endPoint: AppConfig.cartItems,
      requiresToken: true,
      body: null,
    );

    final List<dynamic> cartItem = response;
    return cartItem.map((data) => CartModel.fromJson(data)).toList();
  }

  @override
  Future<void> updateCartQuantity({
    required String productId,
    required String quantity,
  }) async {
    final Map<String, dynamic> body = {
      "id": productId,
      "quantity": quantity,
    };
    final response = await apiServices.postApi(
      endPoint: AppConfig.updateCartQuantity,
      isEncodedData: true,
      requiresToken: true,
      body: body,
    );
    return response;
  }

  @override
  Future<CartCounterModel> getCartCounter() async {
    final response = await apiServices.getApi(
      fullApiUrl: AppConfig.profileCounters,
      requiresToken: true,
    );
    print("Cart Counter: $response");
    return CartCounterModel.fromJson(response);
  }

  @override
  Future<CartSummaryModel> getCartSummary() async {
    var response = await apiServices.getApi(
      fullApiUrl: AppConfig.cartSummery,
      requiresToken: true,
    );
    return CartSummaryModel.fromJson(response);
  }
}
