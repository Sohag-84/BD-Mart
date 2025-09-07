import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/enums/payment_method.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';
import 'package:gym_swat/features/address/presentation/bloc/address_bloc.dart';
import 'package:gym_swat/features/address/presentation/widgets/buid_add_address_dialog.dart';
import 'package:gym_swat/features/cart/presentation/cubit/payment_method/payment_method_cubit.dart';
import 'package:gym_swat/features/cart/presentation/part/shipping_address_section.dart';
import 'package:gym_swat/features/cart/presentation/widgets/order_summery_widgets.dart';
import 'package:gym_swat/features/cart/presentation/widgets/select_payment_option_button.dart';

class ShippingDetailsView extends StatefulWidget {
  const ShippingDetailsView({super.key});

  @override
  State<ShippingDetailsView> createState() => _ShippingDetailsViewState();
}

class _ShippingDetailsViewState extends State<ShippingDetailsView> {
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(FetchedShippingAddress());
  }

  @override
  void dispose() {
    addressController.dispose();
    postalCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //add new address button
              customButton(
                onTap: () async {
                  await buildAddAddressDialog(
                    context: context,
                    addressController: addressController,
                    postalCodeController: postalCodeController,
                    phoneController: phoneController,
                  );
                },
                btnText: "+ $addNewAddress",
                color: AppColors.darkCharcoal,
                fontColor: AppColors.whiteColor,
              ),
              Gap(10.h),

              /// Shipping address list
              shippingAddressSection(),
              Gap(10.h),

              ///order summery
              const OrderSummaryWidget(),
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
                  SelectPaymentOptionButton(
                      method: PaymentMethod.cashOnDelivery),
                  SelectPaymentOptionButton(
                      method: PaymentMethod.onlinePayment),
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
      ),
    );
  }
}
