import 'package:gym_swat/core/constants/exports.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:gym_swat/features/cart/presentation/cubit/cart_summary/cart_summary_cubit.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartSummaryCubit, CartSummaryState>(
      builder: (context, state) {
        if (state is CartSummaryFailure) {
          return const SizedBox();
        } else if (state is CartSummaryLoaded) {
          final summary = state.cartSummary;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Summary",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Divider(),

              /// Subtotal, Tax, Total
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    _summaryRow("Subtotal", summary.subTotal ?? "0"),
                    _summaryRow("Shipping Cost", summary.shippingCost ?? "0"),
                    _summaryRow("Tax", summary.tax ?? "0"),
                    _summaryRow("Discount", summary.discount ?? "0"),
                    Gap(5.h),
                    const DottedLine(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      lineLength: double.infinity,
                      dashColor: AppColors.darkCharcoal,
                      dashGapColor: Colors.transparent,
                    ),
                    _summaryRow(
                      "Total",
                      "${summary.grandTotal}",
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  /// product item row
  Widget productItem(String name, int quantity, double price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "$name × $quantity",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          Text(
            "৳${price.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  /// summary row (Subtotal, Tax, Total)
  Widget _summaryRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
