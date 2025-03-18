import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/cart/controller/cart_controller.dart';

Widget paymentOptionButton(String option) {
  final controller = Get.put(CartController());
  return Obx(
    () => GestureDetector(
      onTap: () {
        controller.selectPaymentMethod(option);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 0.8,
            child: Radio<String>(
              value: option,
              groupValue: controller.selectedPaymentMethod.value,
              activeColor: AppColors.greenColor,
              onChanged: (String? value) {
                if (value != null) {
                  controller.selectPaymentMethod(value);
                }
              },
            ),
          ),
          Text(
            option,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    ),
  );
}
