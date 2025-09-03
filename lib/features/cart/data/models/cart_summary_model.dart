import 'package:gym_swat/features/cart/domain/entities/cart_summary_entity.dart';

class CartSummaryModel extends CartSummaryEntity {
  CartSummaryModel({
    required super.subTotal,
    required super.tax,
    required super.shippingCost,
    required super.discount,
    required super.grandTotal,
    required super.grandTotalValue,
    required super.couponCode,
    required super.couponApplied,
  });

  factory CartSummaryModel.fromJson(Map<String, dynamic> json) {
    return CartSummaryModel(
      subTotal: json["sub_total"],
      tax: json["tax"],
      shippingCost: json["shipping_cost"],
      discount: json["discount"],
      grandTotal: json["grand_total"],
      grandTotalValue: json["grand_total_value"],
      couponCode: json["coupon_code"],
      couponApplied: json["coupon_applied"],
    );
  }
}
