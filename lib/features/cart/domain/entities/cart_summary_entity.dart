class CartSummaryEntity {
  final String? subTotal;
  final String? tax;
  final String? shippingCost;
  final String? discount;
  final String? grandTotal;
  final int? grandTotalValue;
  final dynamic couponCode;
  final bool? couponApplied;

  CartSummaryEntity({
    required this.subTotal,
    required this.tax,
    required this.shippingCost,
    required this.discount,
    required this.grandTotal,
    required this.grandTotalValue,
    required this.couponCode,
    required this.couponApplied,
  });

  CartSummaryEntity copyWith({
    String? subTotal,
    String? tax,
    String? shippingCost,
    String? discount,
    String? grandTotal,
    int? grandTotalValue,
    dynamic couponCode,
    bool? couponApplied,
  }) {
    return CartSummaryEntity(
      subTotal: subTotal ?? this.subTotal,
      tax: tax ?? this.tax,
      shippingCost: shippingCost ?? this.shippingCost,
      discount: discount ?? this.discount,
      grandTotal: grandTotal ?? this.grandTotal,
      grandTotalValue: grandTotalValue ?? this.grandTotalValue,
      couponCode: couponCode ?? this.couponCode,
      couponApplied: couponApplied ?? this.couponApplied,
    );
  }
}
