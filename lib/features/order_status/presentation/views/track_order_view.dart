import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';
import 'package:gym_swat/features/order_status/presentation/bloc/order_status_bloc.dart';
import 'package:gym_swat/features/order_status/presentation/widgets/track_order_details_row.dart';

class TrackOrderView extends StatefulWidget {
  const TrackOrderView({super.key});

  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
  TextEditingController orderCodeController = TextEditingController();

  bool isTrack = false;

  @override
  void dispose() {
    super.dispose();
    orderCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track Order",
        ),
        elevation: 0.0,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Check Your Order Status",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              Gap(20.h),
              TextField(
                controller: orderCodeController,
                keyboardType: TextInputType.name,
                showCursor: true,
                decoration: const InputDecoration(
                  hintText: orderCodeHintText,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGreyColor),
                  ),
                ),
              ),
              Gap(20.h),
              customButton(
                onTap: () {
                  final orderCode = orderCodeController.text;
                  if (orderCode.isNotEmpty) {
                    context
                        .read<OrderStatusBloc>()
                        .add(FetchedTrackOrder(orderCode: orderCode));
                    setState(() {
                      isTrack = true;
                    });
                  } else {
                    Fluttertoast.showToast(msg: "Please enter an order code.");
                  }
                },
                btnText: trackOrder,
              ),
              Gap(25.h),
              BlocBuilder<OrderStatusBloc, OrderStatusState>(
                builder: (context, state) {
                  if (state is TrackOrderLoading) {
                    return loader();
                  } else if (state is TrackOrderFailure) {
                    return const Center(child: Text("Something went wrong!"));
                  } else if (state is TrackOrderLoaded) {
                    if (isTrack == false) {
                      return Container();
                    }
                    if (state.orderList.isEmpty) {
                      return Text(
                        "No order found.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      );
                    } else {
                      final order = state.orderList[0];
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Details",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const Divider(color: AppColors.lightGreyColor),
                            Gap(10.h),
                            trackOrderDetailRow("Order Code:", order.code),
                            trackOrderDetailRow(
                                "Payment Type:", order.paymentType),
                            trackOrderDetailRow(
                                "Payment Status:", order.paymentStatusString),
                            trackOrderDetailRow(
                                "Delivery Status:", order.deliveryStatusString),
                            trackOrderDetailRow(
                                "Grand Total:", order.grandTotal),
                            trackOrderDetailRow("Order Date:", order.date),
                          ],
                        ),
                      );
                    }
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
