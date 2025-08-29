class CartEntity {
  final String? name;
  final int? ownerId;
  final List<CartItemEntity> cartItems;
  CartEntity({
    required this.name,
    required this.ownerId,
    required this.cartItems,
  });
}

class CartItemEntity {
  final int? id;
  final int? ownerId;
  final int? userId;
  final int? productId;
  final String? productName;
  final String? productThumbnailImage;
  final String? variation;
  final int? price;
  final String? currencySymbol;
  final int? tax;
  final int? shippingCost;
  int? quantity;
  final int? lowerLimit;
  final int? upperLimit;
  bool selected; // For tracking product selection

  CartItemEntity({
    required this.id,
    required this.ownerId,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.productThumbnailImage,
    required this.variation,
    required this.price,
    required this.currencySymbol,
    required this.tax,
    required this.shippingCost,
    required this.quantity,
    required this.lowerLimit,
    required this.upperLimit,
    this.selected = false,
  });
}
