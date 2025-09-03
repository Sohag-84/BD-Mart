import 'package:gym_swat/features/cart/domain/entities/cart_counter_entity.dart';

class CartCounterModel extends CartCounterEntity {
  CartCounterModel({
    required super.cartItemCount,
    required super.wishlistItemCount,
    required super.orderCount,
  });

  factory CartCounterModel.fromJson(Map<String, dynamic> json) {
    return CartCounterModel(
      cartItemCount: json["cart_item_count"],
      wishlistItemCount: json["wishlist_item_count"],
      orderCount: json["order_count"],
    );
  }
}
