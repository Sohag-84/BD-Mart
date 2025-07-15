import 'package:gym_swat/core/constants/exports.dart';

class RefundSection extends StatelessWidget {
  final VoidCallback onViewPolicyTap;

  const RefundSection({super.key, required this.onViewPolicyTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onViewPolicyTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.only(top: 8.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Text(
              "Refund:",
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.primaryColor,
              ),
            ),
            Gap(5.w),
            Image.asset(
              refreshIcon,
              height: 30,
            ),
            Gap(5.w),
            Text(
              gymSwatRefundText,
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              viewPolicy,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
