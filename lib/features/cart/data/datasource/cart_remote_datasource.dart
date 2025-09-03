import 'package:gym_swat/features/cart/data/models/cart_counter_model.dart';
import 'package:gym_swat/features/cart/data/models/cart_model.dart';
import 'package:gym_swat/features/cart/data/models/cart_summary_model.dart';

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

  Future<CartCounterModel> getCartCounter();

  Future<CartSummaryModel> getCartSummary();
}
