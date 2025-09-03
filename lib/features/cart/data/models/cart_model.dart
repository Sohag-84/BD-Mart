import 'package:gym_swat/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.name,
    required super.ownerId,
    required super.cartItems,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      name: json["name"],
      ownerId: json["owner_id"],
      cartItems: json["cart_items"] == null
          ? []
          : List<CartItemModel>.from(
              json["cart_items"]!.map(
                (x) => CartItemModel.fromJson(x),
              ),
            ),
    );
  }
}

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.id,
    required super.ownerId,
    required super.userId,
    required super.productId,
    required super.productName,
    required super.productThumbnailImage,
    required super.variation,
    required super.price,
    required super.currencySymbol,
    required super.tax,
    required super.shippingCost,
    required super.quantity,
    required super.lowerLimit,
    required super.upperLimit,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json["id"],
      ownerId: json["owner_id"],
      userId: json["user_id"],
      productId: json["product_id"],
      productName: json["product_name"],
      productThumbnailImage: json["product_thumbnail_image"],
      variation: json["variation"],
      price: json["price"],
      currencySymbol: json["currency_symbol"],
      tax: json["tax"],
      shippingCost: json["shipping_cost"],
      quantity: json["quantity"],
      lowerLimit: json["lower_limit"],
      upperLimit: json["upper_limit"],
    );
  }
}
