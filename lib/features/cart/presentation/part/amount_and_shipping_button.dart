import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';
import 'package:gym_swat/features/cart/presentation/cubit/cart_summary/cart_summary_cubit.dart';

Widget amountAndShippingButton({
  required VoidCallback onTap,
}) {
  return BlocBuilder<CartSummaryCubit, CartSummaryState>(
    builder: (context, state) {
      int totalAmount = 0;
      if (state is CartSummaryLoaded) {
        totalAmount = state.cartSummary.grandTotalValue ?? 0;
      }

      return totalAmount == 0
          ? const SizedBox()
          : Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 2,
                    offset: const Offset(-0.1, -0.1),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "$takaSign $totalAmount",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  customButton(
                    height: 40,
                    onTap: onTap,
                    btnText: "Checkout",
                    fontSize: 14,
                    fontColor: AppColors.secondaryColor,
                    color: AppColors.darkCharcoal,
                  ),
                  Gap(10.h),
                ],
              ),
            );
    },
  );
}
