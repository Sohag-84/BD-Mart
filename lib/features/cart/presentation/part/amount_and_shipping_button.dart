import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/custom_button.dart';

Widget amountAndShippingButton({
  required String totalAmount,
  required VoidCallback onTap,
}) {
  return Container(
    height: 100,
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.1),
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
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                totalAmount,
                style: TextStyle(
                  fontSize: 14.sp,
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
}
