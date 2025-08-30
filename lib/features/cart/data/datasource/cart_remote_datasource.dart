import 'package:gym_swat/features/cart/data/model/cart_model.dart';

abstract interface class CartRemoteDatasource {
  Future<String> addToCart({
    required String productId,
    required String variant,
    required String color,
    required String quantity,
  });

  Future<List<CartModel>> getCartItems();

  Future<void> deleteCartItem({required String productId});

  Future<void> updateCartQuantity({
    required String productId,
    required String quantity,
  });
}
