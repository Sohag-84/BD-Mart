import 'package:gym_swat/core/constants/exports.dart';

Widget trackOrderDetailRow(String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
