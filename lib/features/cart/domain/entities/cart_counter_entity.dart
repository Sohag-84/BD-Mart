class CartCounterEntity {
  final int? cartItemCount;
  final int? wishlistItemCount;
  final int? orderCount;

  CartCounterEntity({
    required this.cartItemCount,
    required this.wishlistItemCount,
    required this.orderCount,
  });

  CartCounterEntity copyWith({
    int? cartItemCount,
    int? wishlistItemCount,
    int? orderCount,
  }) {
    return CartCounterEntity(
      cartItemCount: cartItemCount ?? this.cartItemCount,
      wishlistItemCount: wishlistItemCount ?? this.wishlistItemCount,
      orderCount: orderCount ?? this.orderCount,
    );
  }
}
