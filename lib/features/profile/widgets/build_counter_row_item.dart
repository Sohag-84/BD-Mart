import 'package:gym_swat/core/constants/exports.dart';

Widget buildCountersRowItem({
  required VoidCallback onTap,
  required String counter,
  required String title,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      width: Get.width / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.darkCharcoal,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            counter,
            maxLines: 2,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(5.h),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
