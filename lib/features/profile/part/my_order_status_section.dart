import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/profile/widgets/build_order_status_item.dart';

Widget buildMyOrdersSection() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    decoration: BoxDecoration(
      color: AppColors.darkCharcoal,
      borderRadius: BorderRadius.circular(8.r),
      boxShadow: boxShadow,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          /// pending, confirm & pickup orders
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOrderStatusItem(
                pendingOrders,
                Icons.pending_actions,
                () {},
                badgeCount: 0,
              ),
              Gap(5.w),
              buildOrderStatusItem(
                confirm,
                Icons.check_circle_outline,
                () {},
                badgeCount: 0,
              ),
              Gap(5.w),
              //pickup
              buildOrderStatusItem(
                pickedUp,
                Icons.shopping_bag_outlined,
                () {},
                badgeCount: 0,
              ),
            ],
          ),
          Gap(10.h),

          ///on the ways orders,delivered & unpaid orders
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOrderStatusItem(
                onTheWay,
                Icons.local_shipping_outlined,
                () {},
                badgeCount: 0,
              ),
              Gap(5.w),
              //deliverd
              buildOrderStatusItem(
                delivered,
                Icons.delivery_dining_outlined,
                () {},
                badgeCount: 0,
              ),
              Gap(5.w),
              //unpaid orders
              buildOrderStatusItem(
                unPaidOrders,
                Icons.payment_outlined,
                () {},
                badgeCount: 0,
              ),
            ],
          ),
          Gap(10.h),

          ///delivered and unpaid orders
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ],
      ),
    ),
  );
}
