import 'package:flutter/services.dart';
import 'package:gym_swat/core/constants/exports.dart';

class AllOrderItemContainer extends StatelessWidget {
  final String orderId;
  final String date;
  final String paymentStatus;
  final String deliveryStatus;
  final String price;
  final Color paymentStatusColor;
  final Color deliveryStatusColor;
  final VoidCallback onTap;

  const AllOrderItemContainer({
    super.key,
    required this.orderId,
    required this.date,
    required this.paymentStatus,
    required this.deliveryStatus,
    required this.price,
    required this.paymentStatusColor,
    required this.deliveryStatusColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    orderId,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.copy,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: orderId));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Order code $orderId copied!"),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
            Text("Order date: $date"),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Price- ",
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: price,
                    style: const TextStyle(
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Payment Status- ",
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: paymentStatus,
                    style: TextStyle(
                      color: paymentStatusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Delivery Status- ",
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: deliveryStatus,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: deliveryStatusColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
