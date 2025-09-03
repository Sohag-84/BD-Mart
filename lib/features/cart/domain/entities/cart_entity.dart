class CartEntity {
  final String? name;
  final int? ownerId;
  final List<CartItemEntity> cartItems;
  final bool selected;

  const CartEntity({
    required this.name,
    required this.ownerId,
    required this.cartItems,
    this.selected = false,
  });

  CartEntity copyWith({
    String? name,
    int? ownerId,
    List<CartItemEntity>? cartItems,
    bool? selected,
  }) {
    return CartEntity(
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      cartItems: cartItems ?? this.cartItems,
      selected: selected ?? this.selected,
    );
  }
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
  final int? quantity;
  final int? lowerLimit;
  final int? upperLimit;
  final bool selected;
  final bool isDeleting;

  const CartItemEntity({
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
    this.isDeleting = false,
  });

  CartItemEntity copyWith({
    int? id,
    int? ownerId,
    int? userId,
    int? productId,
    String? productName,
    String? productThumbnailImage,
    String? variation,
    int? price,
    String? currencySymbol,
    int? tax,
    int? shippingCost,
    int? quantity,
    int? lowerLimit,
    int? upperLimit,
    bool? selected,
    bool? isDeleting,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productThumbnailImage:
          productThumbnailImage ?? this.productThumbnailImage,
      variation: variation ?? this.variation,
      price: price ?? this.price,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      tax: tax ?? this.tax,
      shippingCost: shippingCost ?? this.shippingCost,
      quantity: quantity ?? this.quantity,
      lowerLimit: lowerLimit ?? this.lowerLimit,
      upperLimit: upperLimit ?? this.upperLimit,
      selected: selected ?? this.selected,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }
}
