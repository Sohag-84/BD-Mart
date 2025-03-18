import 'package:gym_swat/core/constants/exports.dart';

class CartController extends GetxController {
  RxString selectedPaymentMethod = 'Online Payment'.obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }
}
