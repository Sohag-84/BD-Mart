import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart'
    show SSLCommerzInitialization;
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/enums/payment_method.dart';
import 'package:gym_swat/core/routes/app_pages.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';
import 'package:gym_swat/features/address/domain/entities/shipping_address_entity.dart';
import 'package:gym_swat/features/address/presentation/bloc/address_bloc.dart';
import 'package:gym_swat/features/address/presentation/widgets/buid_add_address_dialog.dart';
import 'package:gym_swat/features/cart/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:gym_swat/features/cart/presentation/cubit/cart_counter/cart_counter_cubit.dart';
import 'package:gym_swat/features/cart/presentation/cubit/cart_summary/cart_summary_cubit.dart';
import 'package:gym_swat/features/cart/presentation/cubit/payment_method/payment_method_cubit.dart';
import 'package:gym_swat/features/cart/presentation/part/shipping_address_section.dart';
import 'package:gym_swat/features/cart/presentation/widgets/order_summery_widgets.dart';
import 'package:gym_swat/features/cart/presentation/widgets/select_payment_option_button.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ShippingDetailsView extends StatefulWidget {
  const ShippingDetailsView({super.key});

  @override
  State<ShippingDetailsView> createState() => _ShippingDetailsViewState();
}

class _ShippingDetailsViewState extends State<ShippingDetailsView> {
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String selectedAdressId(BuildContext context) {
    final addressState = context.read<AddressBloc>().state;
    String addressId = "";
    if (addressState is AddressLoaded &&
        addressState.selectedAddressId.isNotEmpty) {
      AddressEntity selectedAddress = addressState.shippingAddressList
          .firstWhere((address) =>
              address.id.toString() == addressState.selectedAddressId);
      addressId = selectedAddress.id.toString();
    }
    return addressId;
  }

  String selectedPayemtnType(BuildContext context) {
    final paymentState = context.read<PaymentMethodCubit>().state;
    return paymentState == PaymentMethod.cashOnDelivery
        ? "Cash on Delivery"
        : "Online Payment";
  }

  Future<String> onlinePayment({required String amount}) async {
    String cleanedAmount = amount.replaceAll(",", "");
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        // multi_card_name: "visa,master,bkash",
        store_id: "${dotenv.env['STROE_ID']}",
        store_passwd: "${dotenv.env['STROE_PASSWORD']}",
        total_amount: double.parse(cleanedAmount),
        currency: SSLCurrencyType.BDT,
        tran_id: DateTime.now().millisecondsSinceEpoch.toString(),
        product_category: 'Top Up',
        sdkType: SSLCSdkType.TESTBOX,
      ),
    );

    final response = await sslcommerz.payNow();
    return response.status ?? "";
  }

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
        child: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutLoading) {
              eassyLoading();
            } else {
              EasyLoading.dismiss();
            }
            if (state is CheckoutFailed) {
              Fluttertoast.showToast(msg: "Something went wrong!");
            }
            if (state is CheckoutSuccess) {
              Fluttertoast.showToast(msg: state.response.message ?? "");
              if (state.response.result == true) {
                context.go(AppRoutes.bottomNavbar.path);
                context.read<CartCounterCubit>().cartCounter();
              }
            }
          },
          builder: (context, state) {
            return customButton(
              onTap: () async {
                if (selectedAdressId(context).isEmpty) {
                  Fluttertoast.showToast(msg: "Please Select Shipping Address");
                  return;
                }
                if (selectedPayemtnType(context).isEmpty) {
                  Fluttertoast.showToast(msg: "Please Select Payment Option");
                  return;
                }
                if (selectedPayemtnType(context) == "Online Payment") {
                  final state = context.read<CartSummaryCubit>().state;
                  if (state is CartSummaryLoaded) {
                    String result = await onlinePayment(
                      amount: 
                        state.cartSummary.grandTotal ?? "0",
                      
                    );
                    if (result == "VALID") {
                      context.read<CheckoutBloc>().add(
                            CheckoutOrder(
                              addressId: selectedAdressId(context),
                              paymentType: selectedPayemtnType(context),
                            ),
                          );
                    }
                  }
                } else {
                  context.read<CheckoutBloc>().add(
                        CheckoutOrder(
                          addressId: selectedAdressId(context),
                          paymentType: selectedPayemtnType(context),
                        ),
                      );
                }
              },
              btnText: proceedToCheckout,
              fontSize: 14,
              color: AppColors.darkCharcoal,
              fontColor: AppColors.secondaryColor,
            );
          },
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
                    method: PaymentMethod.cashOnDelivery,
                  ),
                  SelectPaymentOptionButton(
                    method: PaymentMethod.onlinePayment,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
