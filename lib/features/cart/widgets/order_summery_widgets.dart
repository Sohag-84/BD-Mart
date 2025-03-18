import 'package:gym_swat/core/constants/exports.dart';
import 'package:dotted_line/dotted_line.dart';

class OrderSummaryWidget extends StatelessWidget {
  final int itemCount;
  final String subtotal;
  final String shippingCost;
  final String tax;
  final String discount;
  final String total;

  const OrderSummaryWidget({
    required this.itemCount,
    required this.subtotal,
    required this.shippingCost,
    required this.tax,
    required this.discount,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Summary",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                "$itemCount Items",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
        const Divider(),

        /// Subtotal, Tax, Total
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              _summaryRow("Subtotal", subtotal),
              _summaryRow("Shipping Cost", shippingCost),
              _summaryRow("Tax", tax),
              _summaryRow("Discount", discount),
              Gap(5.h),
              const DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                dashColor: AppColors.darkCharcoal,
                dashGapColor: Colors.transparent,
              ),
              _summaryRow("Total", total, isBold: true),
            ],
          ),
        ),
      ],
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
