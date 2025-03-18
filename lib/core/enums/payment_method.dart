enum PaymentMethod { cashOnDelivery, onlinePayment }

extension PaymentMethodExtension on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.cashOnDelivery:
        return "Cash On Delivery";
      case PaymentMethod.onlinePayment:
        return "Online Payment";
    }
  }
}
