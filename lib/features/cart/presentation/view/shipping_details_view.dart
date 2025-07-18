import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/enums/payment_method.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';
import 'package:gym_swat/features/cart/presentation/cubit/payment_method_cubit.dart';
import 'package:gym_swat/features/cart/presentation/widgets/order_summery_widgets.dart';
import 'package:gym_swat/features/cart/presentation/widgets/select_payment_option_button.dart';

class ShippingDetailsView extends StatelessWidget {
  const ShippingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: shippingDetails,
        isSearchButton: false,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.w),
        child: customButton(
          onTap: () {},
          btnText: proceedToCheckout,
          fontSize: 14,
          color: AppColors.darkCharcoal,
          fontColor: AppColors.secondaryColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //add new address button
            customButton(
              onTap: () {},
              btnText: "+ $addNewAddress",
              color: AppColors.darkCharcoal,
              fontColor: AppColors.whiteColor,
            ),
            Gap(10.h),

            ///order summery
            const OrderSummaryWidget(
              itemCount: 10,
              subtotal: "4576",
              shippingCost: "60",
              tax: "12",
              discount: "78",
              total: "10000",
            ),
            Gap(20.h),

            /// Payment Selection Section
            Text(
              "Select a payment option",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(10.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectPaymentOptionButton(method: PaymentMethod.cashOnDelivery),
                SelectPaymentOptionButton(method: PaymentMethod.onlinePayment),
              ],
            ),
            BlocBuilder<PaymentMethodCubit, PaymentMethod>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    String paymentText = state == PaymentMethod.cashOnDelivery
                        ? "Cash on Delivery"
                        : "Online Payment";

                        print(paymentText);
                  },
                  child: Text("data"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
