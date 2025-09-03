import 'package:gym_swat/core/utils/typedef.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_counter_entity.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_entity.dart';
import 'package:gym_swat/features/cart/domain/entities/cart_summary_entity.dart';

abstract interface class CartRepository {
  ResultFuture<String> addToCart({
    required String productId,
    required String variant,
    required String color,
    required String quantity,
  });

  ResultFuture<List<CartEntity>> getCartItems();

  ResultFuture<void> deleteCartItem({required String productId});

  ResultFuture<void> updateCartQuantity({
    required String productId,
    required String quantity,
  });

  ResultFuture<CartCounterEntity> getCartCounter();

  ResultFuture<CartSummaryEntity> getCartSummary();
}
